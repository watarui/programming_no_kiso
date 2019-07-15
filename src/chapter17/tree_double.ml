#use "src/chapter17/tree_t.ml";;

(* 木の例 *)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

(* 目的 : tree_t 型の木を受け取ったら、含まれる値を全て 2 倍にした木を返す *)
(* tree_double : tree_t -> tree_t *)
let rec tree_double tree =
  match tree with
  | Empty -> Empty
  | Leaf (n) -> Leaf (n * 2)
  | Node (t1, n, t2) -> Node (tree_double t1, n * 2, tree_double t2)

let test1 = tree_double tree1 = Empty
let test2 = tree_double tree2 = Leaf (6)
let test3 = tree_double tree3 = Node (Empty, 8, Leaf (6))
let test4 = tree_double tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))
