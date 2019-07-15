#use "src/metro/dijkstra.ml";;
#use "src/metro/ekikan_tree_t.ml";;
#use "src/metro/assoc.ml";;

(* 目的 : ekikan_tree_t 型の木と ekikan_t 型の駅間を受け取り、その情報を挿入した木を返す *)
(* insert_ekikan : ekikan_tree_t -> ekikan_t -> ekikan_tree_t *)
let insert_ekikan tree lst =
  match lst with
    {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} ->
    let rec insert_ekikan' tree kiten shuten kyori =
      match tree with
      | Empty -> Node (Empty, kiten, [(shuten, kyori)], Empty)
      | Node (t1, eki, lst, t2) ->
      if kiten < eki
      then Node (insert_ekikan' t1 kiten shuten kyori, eki, lst, t2)
      else if kiten > eki
      then Node (t1, eki, lst, insert_ekikan' t2 kiten shuten kyori)
      else Node (t1, eki, (shuten, kyori) :: lst, t2) in
    insert_ekikan' (insert_ekikan' tree s k r) k s r

let inserts_ekikan tree lst = List.fold_left insert_ekikan tree lst

(* 目的 : 漢字の駅名を２つ（いずれも文字列）と駅間の木（ekikan_tree_t 型）を受け取り、駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori を木を使用するように再定義したもの *)
(* get_ekikan_kyori2 : string -> string -> ekikan_tree_t -> float *)
let rec get_ekikan_kyori2 eki1 eki2 tree =
  match tree with
  | Empty -> infinity
  | Node (t1, eki, lst, t2) ->
    if eki1 < eki then get_ekikan_kyori2 eki1 eki2 t1
    else if eki < eki1 then get_ekikan_kyori2 eki1 eki2 t2
    else assoc eki2 lst

let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list

(* 目的 : 直前に確定した駅pと未確定の駅のリストvを受け取り、更新処理後の未確定の駅のリストを返す *)
(* koushin を木を使用するように再定義したもの *)
(* koushin2 : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *)
let koushin2 p v tree =
  match p with
    {namae = pn; saitan_kyori = ps; temae_list = pt} ->
    List.map (fun q ->
        match q with
          {namae = qn; saitan_kyori = qs; temae_list = qt} ->
          let kyori = get_ekikan_kyori2 pn qn tree in
          if (kyori = infinity) || (ps +. kyori >= qs)
          then q
          (* 最短距離がp経由のほうが短い場合 *)
          else {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt}
      )
      v

(* 目的 : eki_t list型の未確定の駅のリストと、ekikan_tree_t 型の木を受け取り、各駅について最短距離と最短経路が正しく入ったリストを返す *)
(* dijkstra_main を木を使用するように再定義したもの *)
(* dijkstra_main2 : eki_t list -> ekikan_tree_t -> eki_t list *)
let rec dijkstra_main2 eki_list tree =
  match eki_list with
  | [] -> []
  | first :: rest ->
    let (saitan, except) = saitan_wo_bunri eki_list in
    saitan :: dijkstra_main2 (koushin2 saitan except tree) tree

(* 目的 : 始点のローマ字駅名と、終点のローマ字駅名を受け取り、ダイクストラ法に従って最短経路を求め、そのレコードを返す *)
(* dijkstra は駅間リストを使用し、dijkstra2 は駅間の木を使用する *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra2 shiten shuten =
  let kanji_shiten = romaji_to_kanji shiten sorted_global_ekimei_list in
  let kanji_shuten = romaji_to_kanji shuten sorted_global_ekimei_list in
  let eki_list = make_initial_eki_list sorted_global_ekimei_list kanji_shiten in
  let eki_list' = dijkstra_main2 eki_list global_ekikan_tree in
  let rec get_shuten_record kanji_shuten lst =
    match lst with
    | [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
    | {namae = n; saitan_kyori = s; temae_list = t} as first :: rest ->
      if n = kanji_shuten
      then first
      else get_shuten_record kanji_shuten rest in
  get_shuten_record kanji_shuten eki_list'

let test1 = dijkstra2 "shibuya" "tokyo" =
            {
              namae = "東京";
              saitan_kyori = 7.4;
              temae_list = ["東京"; "銀座"; "霞ヶ関"; "国会議事堂前"; "赤坂"; "乃木坂"; "表参道"; "渋谷"]
            }
