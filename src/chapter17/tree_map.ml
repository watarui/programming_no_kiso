#use "src/chapter17/tree_t.ml";;

(* 木の例 *)
let tree1 = Empty
let tree2 = Leaf (3)
let tree3 = Node (tree1, 4, tree2)
let tree4 = Node (tree2, 5, tree3)

(* 目的 : int -> int 型の関数 f と tree_t 型の木を受け取ったら、含まれる値全てに f を適用した木を返す *)
(* tree_map : (int -> int) -> tree_t -> tree_t *)
let rec tree_map f tree =
  match tree with
  | Empty -> Empty
  | Leaf (n) -> Leaf (f n)
  | Node (t1, n, t2) -> Node (tree_map f t1, f n, tree_map f t2)

let test1 = tree_map (fun x -> x * 2) tree1 = Empty
let test2 = tree_map (fun x -> x * 2) tree2 = Leaf (6)
let test3 = tree_map (fun x -> x * 2) tree3 = Node (Empty, 8, Leaf (6))
let test4 = tree_map (fun x -> x * 2) tree4 = Node (Leaf (6), 10, Node (Empty, 8, Leaf (6)))
