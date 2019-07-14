#use "src/chapter17/tree_t.ml";;

(* 木の例 *)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

(* 目的 : tree_t 型の木を受け取ったら、節と葉が合計いくつあるかを返す *)
(* tree_length : tree_t -> int *)
let rec tree_length tree =
  match tree with
  | Empty -> 0
  | Leaf (n) -> 1
  | Node (t1, n, t2) -> tree_length t1 + 1 + tree_length t2

let test1 = tree_length tree1 = 0
let test2 = tree_length tree2 = 1
let test3 = tree_length tree3 = 2
let test4 = tree_length tree4 = 4
