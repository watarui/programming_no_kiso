#use "../../src/metro/ekikan_t.ml";;
#use "../../src/metro/global_ekikan_list.ml";;

let rec insert_ekikan' tree kiten shuten kyori =
  let value =
    try Tree.search tree kiten with
    | Not_found -> [] in
  Tree.insert tree kiten ((shuten, kyori) :: value)

(* inserts_ekikan : (string * (string * float) list) Tree.t -> ekikan_t list -> (string * (string * float) list) Tree.t *)
(* 目的 : Tree.t 型の木と ekikan_t 型の駅間を受け取り、その情報を挿入した木を返す *)
(* insert_ekikan : (string * (string * float) list) Tree.t -> ekikan_t -> (string * (string * float) list) Tree.t *)
let insert_ekikan tree lst =
  match lst with
    {kiten = k; shuten = s; keiyu = y; kyori = r; jikan = j} ->
    insert_ekikan' (insert_ekikan' tree s k r) k s r

let inserts_ekikan tree lst = List.fold_left insert_ekikan tree lst

(* 目的 : 漢字の駅名を２つ（いずれも文字列）と駅間の木（Tree.t 型）を受け取り、駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori を 2 分探索モジュールを使用するように変更 *)
(* ./my-tree.top 上で実行する *)
(* get_ekikan_kyori2 : string -> string -> (string * (string * float) list) Tree.t -> float *)
let get_ekikan_kyori3 eki1 eki2 tree = List.assoc eki2 (Tree.search tree eki1)

let global_ekikan_tree = inserts_ekikan Tree.empty global_ekikan_list

(* test *)
let test1 = get_ekikan_kyori3 "表参道" "乃木坂" global_ekikan_tree = 1.4
let test2 = get_ekikan_kyori3 "国会議事堂前" "赤坂" global_ekikan_tree = 0.8
(* let test3 = get_ekikan_kyori2 "表参道" "横浜" global_ekikan_tree = infinity *)
(* let test4 = get_ekikan_kyori2 "横浜" "赤坂" global_ekikan_tree = infinity *)
