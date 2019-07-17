open Metro;;
open RedBlack;;

(* RedBlack.insert と衝突するのでコメントアウト *)
(* open Heap;; *)

(* グラフの中の節（駅）を表すレコード型 *)
type eki_t = {
  namae : string; (* 駅名 *)
  saitan_kyori : float; (* 最短距離 *)
  temae_list : string list; (* 手前の駅名のリスト *)
}

type ekikan_tree_t = Empty
                   (* Leaf は左右の子が Empty であるような Node で代用する *)
                   (* 駅名（漢字）, [(その駅に直接つながっている駅名（漢字）, その駅までの距離), ...] *)
                   | Node of ekikan_tree_t * string * (string * float) list * ekikan_tree_t

(* 未確定駅の最短距離、駅名、手前リストを持つヒープ型 *)
(* type heap_t = (float, string * string list) Heap.t *)

(* 各駅のヒープ中の位置を表す木の型。index_t は Heap で定義済み *)
(* type index_tree_t = (string, index_t) Tree.t *)

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

(* 目的：ekikan_tree から eki_heap と index_tree を作り、kiten を初期化する *)
(* make_eki_heap_and_index_tree : string -> ekikan_tree_t -> heap_t * index_tree_t *)
let make_eki_heap_and_index_tree kiten ekikan_tree =
  traverse (fun (eki_heap, index_tree) k lst ->
      let (index, heap) = Heap.insert eki_heap
          (if k = kiten then 0. else infinity)
          (k, if k = kiten then [k] else []) in
      let index_tree' = insert index_tree k index in
      (heap, index_tree'))
    ((Heap.create (length ekikan_tree) 0. ("駅名", [])), empty)
    ekikan_tree

(* 目的：確定した駅に接続している駅の最短距離、手前リストを更新する *)
(* koushin : string -> float -> string list -> heap_t -> ekikan_tree_t -> index_tree_t -> heap_t *)
let koushin pn ps pt eki_heap ekikan_tree index_tree =
  let lst = search ekikan_tree pn in
  List.fold_left (fun eki_heap (shuten, kyori) ->
      try
        let shuten_index = search index_tree shuten in
        let (saitan_kyori, (n, _)) = Heap.get eki_heap shuten_index in
        let new_saitan_kyori = ps +. kyori in
        if new_saitan_kyori <= saitan_kyori
        then Heap.set eki_heap shuten_index new_saitan_kyori (n, (n :: pt))
        else eki_heap
      with
      | Not_found -> eki_heap)
    eki_heap
    lst

(* 目的：未確定駅のリストと駅間リストから、各駅への最短路を求める *)
(* dijkstra_main : heap_t -> ekikan_tree_t -> index_tree_t -> eki_t list *)
let rec dijkstra_main eki_heap ekikan_tree index_tree =
  if Heap.length eki_heap = 0
  then []
  else let ((ps, (pn, pt)), rest_heap) = Heap.split_top eki_heap in
    let eki_heap2 = koushin pn ps pt rest_heap ekikan_tree index_tree in
    {namae = pn; saitan_kyori = ps; temae_list = pt} :: dijkstra_main eki_heap2 ekikan_tree index_tree

(* 目的 : 始点のローマ字駅名と、終点のローマ字駅名を受け取り、ダイクストラ法に従って最短経路を求め、そのレコードを返す *)
(* dijkstra : string -> string -> eki_t *)
let dijkstra shiten shuten =
  let kanji_shiten = romaji_to_kanji shiten sorted_global_ekimei_list in
  let kanji_shuten = romaji_to_kanji shuten sorted_global_ekimei_list in
  let (eki_heap, index_tree) = make_eki_heap_and_index_tree kanji_shiten global_ekikan_tree in
  let eki_list = dijkstra_main eki_heap global_ekikan_tree index_tree in
  let rec get_shuten_record kanji_shuten lst =
    match lst with
    | [] -> {namae = ""; saitan_kyori = infinity; temae_list = []}
    | {namae = n; saitan_kyori = s; temae_list = t} as first :: rest ->
      if n = kanji_shuten
      then first
      else get_shuten_record kanji_shuten rest in
  get_shuten_record kanji_shuten eki_list

(* 目的 : eki_t 型の値をきれいに表示するk *)
(* print_eki : eki_t -> unit *)
let print_eki eki =
  match eki with
    {namae = n; saitan_kyori = s; temae_list = t} ->
    match t with
    | [] -> assert false
    | [a] ->
      begin
        print_string ("駅名 : " ^ a);
        print_newline ();
        print_string ("最短距離 : " ^ string_of_float s ^ "km");
        print_newline ();
      end
    | first :: rest ->
      begin
        print_string "駅のリスト : ";
        (* fold_right f [1; 2; 3; 4; 5] init = f 1 (f 2 (f 3 (f 4 (f 5 init)))) *)
        (* fold_right で f を適用する第二引数を捨てる。fold_right 自体の第三引数は print_string に合わせて unit 型にする *)
        List.fold_right (fun x y -> print_string (x ^ " -> ")) rest ();
        print_string first;
        print_newline ();
        print_string ("最短距離 : " ^ string_of_float s ^ "km");
        print_newline ();
      end

(* メイン関数 *)
(* main : int -> unit *)
let main shiten shuten = print_eki (dijkstra shiten shuten)

(* メイン関数の呼び出し *)
let _ = main Sys.argv.(1) Sys.argv.(2)

(* 利用法 : ./dijkstra shibuya ueno *)
