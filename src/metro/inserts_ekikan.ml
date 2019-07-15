#use "src/metro/ekikan_tree_t.ml";;
#use "src/metro/ekikan_t.ml";;

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


let ekikan1 = {kiten="渋谷"; shuten="表参道"; keiyu="半蔵門線"; kyori=1.3; jikan=2}
let ekikan2 = {kiten="上野"; shuten="入谷"; keiyu="日比谷線"; kyori=1.2; jikan=2}
let ekikan3 = {kiten="東京"; shuten="銀座"; keiyu="丸ノ内線"; kyori=1.1; jikan=2}


let tree1 = insert_ekikan Empty ekikan1
let test1 = tree1 =
  Node (Node (Empty, "渋谷", [("表参道", 1.3)], Empty), "表参道",
   [("渋谷", 1.3)], Empty)
let tree2 = insert_ekikan tree1 ekikan2
let test2 = tree2 =
  Node
   (Node
     (Node (Node (Empty, "上野", [("入谷", 1.2)], Empty), "入谷",
       [("上野", 1.2)], Empty),
     "渋谷", [("表参道", 1.3)], Empty),
   "表参道", [("渋谷", 1.3)], Empty)
let tree3 = insert_ekikan tree2 ekikan3
let test3 = tree3 =
  Node
   (Node
     (Node (Node (Empty, "上野", [("入谷", 1.2)], Empty), "入谷",
       [("上野", 1.2)], Node (Empty, "東京", [("銀座", 1.1)], Empty)),
     "渋谷", [("表参道", 1.3)], Empty),
   "表参道", [("渋谷", 1.3)],
   Node (Empty, "銀座", [("東京", 1.1)], Empty))


(* fold_left f init [1; 2; 3; 4; 5] = f (f (f (f (f init 1) 2) 3) 4) 5 *)
(* inserts_ekikan : ekikan_tree_t -> ekikan_t list -> ekikan_tree_t *)
let inserts_ekikan tree lst = List.fold_left insert_ekikan tree lst

let test4 = inserts_ekikan Empty [ekikan1; ekikan2; ekikan3] = tree3
