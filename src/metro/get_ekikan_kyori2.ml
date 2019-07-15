#use "src/metro/inserts_ekikan.ml";;
#use "src/metro/global_ekikan_list.ml";;
#use "src/metro/assoc.ml";;

(* get_ekikan_kyori は駅間リストを線形検索するので計算量は O(N) *)
(* リストではなく木にすると計算量は O(log N) *)

(* 目的 : 漢字の駅名を２つ（いずれも文字列）と駅間の木（ekikan_tree_t 型）を受け取り、駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori を木を使用するように再定義したもの *)
(* get_ekikan_kyori2 : string -> string -> ekikan_tree_t -> float *)
let rec get_ekikan_kyori2 eki1 eki2 tree =
  match tree with
  | Empty -> raise Not_found
  | Node (t1, eki, lst, t2) ->
    if eki1 < eki then get_ekikan_kyori2 eki1 eki2 t1
    else if eki < eki1 then get_ekikan_kyori2 eki1 eki2 t2
    else assoc eki2 lst

let global_ekikan_tree = inserts_ekikan Empty global_ekikan_list

(* test *)
let test1 = get_ekikan_kyori2 "表参道" "乃木坂" global_ekikan_tree = 1.4
let test2 = get_ekikan_kyori2 "国会議事堂前" "赤坂" global_ekikan_tree = 0.8
(* let test3 = get_ekikan_kyori2 "表参道" "横浜" global_ekikan_tree = infinity *)
(* let test4 = get_ekikan_kyori2 "横浜" "赤坂" global_ekikan_tree = infinity *)
