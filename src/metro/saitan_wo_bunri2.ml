#use "src/metro/eki_t.ml";;
#use "src/metro/get_ekikan_kyori.ml";;

let eki0 = {namae=""; saitan_kyori = infinity; temae_list = []}
let eki1 = {namae="池袋"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae="新大塚"; saitan_kyori = 1.2; temae_list = ["新大塚"; "茗荷谷"]}
let eki3 = {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]}
let eki4 = {namae="後楽園"; saitan_kyori = infinity; temae_list = []}

(* 目的 : eki_t list型のリストを受け取ったら、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* saitan_wo_bunri は dijkstra_main 内で空ではないリストの場合にのみ呼び出されているので、空リストに対する記述は不要 *)
(* saitan_wo_bunri2 : eki_t -> eki_t list -> eki_t * eki_t list *)

let saitan_wo_bunri2 eki lst =
  List.fold_right (fun f (p, v) ->
      match (f, p) with
        ({namae = fn; saitan_kyori = fs; temae_list = ft}, {namae = pn; saitan_kyori = ps; temae_list = pt}) ->
        if fs < ps
        then (f, p :: v)
        else (p, f :: v)
    )
    lst
    (eki, [])

let test1 = saitan_wo_bunri2 eki1 [eki2; eki3; eki4] = (eki3, [eki2; eki1; eki4])
