#use "src/metro/saitan_wo_bunri.ml";;

(* #use "src/metro/koushin.ml";; *)

(* 目的 : 直前に確定した駅pと未確定の駅のリストvを受け取り、更新処理後の未確定の駅のリストを返す *)
(* koushin : eki_t -> eki_t list -> ekikan_t list -> eki_t list *)
let koushin p v lst =
  match p with
    {namae = pn; saitan_kyori = ps; temae_list = pt} ->
    List.map (fun q ->
        match q with
          {namae = qn; saitan_kyori = qs; temae_list = qt} ->
          let kyori = get_ekikan_kyori pn qn lst in
          if (kyori = infinity) || (ps +. kyori >= qs)
          then q
          (* 最短距離がp経由のほうが短い場合 *)
          else {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt}
      )
      v

(* 目的 : eki_t list型の未確定の駅のリストと、ekikan_t list型の駅間のリストを受け取り、各駅について最短距離と最短経路が正しく入ったリストを返す *)
(* dijkstra_main : eki_t list -> ekikan_t list -> eki_t list *)
let rec dijkstra_main eki_list ekikan_list =
  match eki_list with
  | [] -> []
  | first :: rest ->
    let (saitan, except) = saitan_wo_bunri eki_list in
    saitan :: dijkstra_main (koushin saitan except ekikan_list) ekikan_list

(*
1. saitan_wo_bunri eki_list は eki_list より要素の少ないリスト except を返す
2. dijkstra_main (koushin saitan except ekikan_list) ekikan_list は元のリストより短くなる
3. 再帰は停止する
*)

let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

let test1 = dijkstra_main [] global_ekikan_list = []
let test2 = dijkstra_main [eki1; eki2; eki3; eki4] global_ekikan_list =
            [
              {namae = "茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
              {namae = "新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]};
              {namae = "後楽園"; saitan_kyori = 1.8; temae_list = ["後楽園"; "茗荷谷"]};
              {namae = "池袋"; saitan_kyori = 3.; temae_list = ["池袋"; "新大塚"; "茗荷谷"]}
            ]
