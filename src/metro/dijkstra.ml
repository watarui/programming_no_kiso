(* トップディレクトリにこのファイルと赤黒木モジュールをおいて実行 *)

open RedBlack;;

#use "src/metro/eki_t.ml";;
#use "src/metro/ekimei_t.ml";;
#use "src/metro/global_ekimei_list.ml";;
#use "src/metro/ekikan_t.ml";;
#use "src/metro/global_ekikan_list.ml";;

#use "src/metro/ekikan_tree_t.ml";;

(* 目的：昇順に並んでいる lst の正しい位置に ekimei を挿入する *)
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec ekimei_insert lst ekimei =
  match lst with
  | [] -> [ekimei]
  | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} as first :: rest ->
    match ekimei with
      {kanji = kj; kana = kn; romaji = r; shozoku = s} ->
      if kana = kn
      then ekimei_insert rest ekimei
      else if kana < kn
      then first :: ekimei_insert rest ekimei
      else ekimei :: lst

(* 目的 : ekimei_t型のリストを受け取り、それをひらがな順に整列し、更に駅の重複を取り除いたekimei_t型のリストを返す *)
(* seiretsu : ekimei_t * list -> ekimei_t * list *)
let rec seiretsu lst =
  match lst with
  | [] -> []
  | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} as first :: rest ->
    ekimei_insert (seiretsu rest) first

(* global_ekimei_list の重複を取り除く *)
let sorted_global_ekimei_list = seiretsu global_ekimei_list

let rec romaji_to_kanji ekimei lst =
  match lst with
  | [] -> ""
  | {kanji = kj; kana = ka; romaji = r; shozoku = s} :: rest ->
    if ekimei = r
    then kj
    else romaji_to_kanji ekimei rest

let make_initial_eki_list ekimei_lst kiten =
  List.map (fun ekimei ->
      match ekimei with
        {kanji = k; kana = n; romaji = r; shozoku = s} ->
        if k = kiten
        then {namae = k; saitan_kyori = 0.; temae_list = [k]}
        else {namae = k; saitan_kyori = infinity; temae_list = []}
    )
    ekimei_lst

(* 目的 : eki_t list型のリストを受け取ったら、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* saitan_wo_bunri : eki_t -> eki_t list -> eki_t * eki_t list *)
let saitan_wo_bunri eki lst =
  List.fold_right (fun f (p, v) ->
      match (f, p) with
        ({namae = fn; saitan_kyori = fs; temae_list = ft}, {namae = pn; saitan_kyori = ps; temae_list = pt}) ->
        if fs < ps
        then (f, p :: v)
        else (p, f :: v)
    )
    lst
    (eki, [])

let rec insert_ekikan' tree kiten shuten kyori =
  let value =
    try search tree kiten with
    | Not_found -> [] in
  insert tree kiten ((shuten, kyori) :: value)

(* 目的 : 木と ekikan_t 型の駅間を受け取り、その情報を挿入した木を返す *)
(* insert_ekikan : (string * (string * float) list) Tree.t -> ekikan_t -> (string * (string * float) list) Tree.t *)
let insert_ekikan tree lst =
  match lst with
    {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} ->
    insert_ekikan' (insert_ekikan' tree s k r) k s r

let inserts_ekikan tree lst = List.fold_left insert_ekikan tree lst

(* 目的 : 漢字の駅名を２つ（いずれも文字列）と駅間の木（Tree.t 型）を受け取り、駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> (string * (string * float) list) Tree.t -> float *)
let get_ekikan_kyori eki1 eki2 tree = List.assoc eki2 (search tree eki1)

let global_ekikan_tree = inserts_ekikan empty global_ekikan_list

(* 目的 : 直前に確定した駅pと未確定の駅のリストvを受け取り、更新処理後の未確定の駅のリストを返す *)
(* koushin : eki_t -> eki_t list -> ekikan_tree_t -> eki_t list *)
let koushin p v lst =
  match p with
    {namae = pn; saitan_kyori = ps; temae_list = pt} ->
    List.map (fun q ->
        match q with
          {namae = qn; saitan_kyori = qs; temae_list = qt} ->
          try
            let kyori = get_ekikan_kyori pn qn lst in
            if ps +. kyori >= qs
            then q
            (* 最短距離がp経由のほうが短い場合 *)
            else {namae = qn; saitan_kyori = ps +. kyori; temae_list = qn :: pt}
          with
          | Not_found -> q
      )
      v

(* 目的 : eki_t list型の未確定の駅のリストと、ekikan_tree_t 型の木を受け取り、各駅について最短距離と最短経路が正しく入ったリストを返す *)
(* dijkstra_main : eki_t list -> ekikan_tree_t -> eki_t list *)
let rec dijkstra_main eki_list tree =
  match eki_list with
  | [] -> []
  | first :: rest ->
    let (saitan, except) = saitan_wo_bunri first rest in
    saitan :: dijkstra_main (koushin saitan except tree) tree

(* 目的 : 始点のローマ字駅名と、終点のローマ字駅名を受け取り、ダイクストラ法に従って最短経路を求め、そのレコードを返す *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra shiten shuten =
  let kanji_shiten = romaji_to_kanji shiten sorted_global_ekimei_list in
  let kanji_shuten = romaji_to_kanji shuten sorted_global_ekimei_list in
  let eki_list = make_initial_eki_list sorted_global_ekimei_list kanji_shiten in
  let eki_list' = dijkstra_main eki_list global_ekikan_tree in
  let rec get_shuten_record kanji_shuten lst =
    match lst with
    | [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
    | {namae = n; saitan_kyori = s; temae_list = t} as first :: rest ->
      if n = kanji_shuten
      then first
      else get_shuten_record kanji_shuten rest in
  get_shuten_record kanji_shuten eki_list'

let test1 = dijkstra "shibuya" "tokyo" =
            {
              namae = "東京";
              saitan_kyori = 7.4;
              temae_list = ["東京"; "銀座"; "霞ヶ関"; "国会議事堂前"; "赤坂"; "乃木坂"; "表参道"; "渋谷"]
            }
