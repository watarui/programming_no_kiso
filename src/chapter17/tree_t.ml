(*
(* 木を表すバリアント型 *)
type tree_t = Empty (* 空の木 *)
            | Leaf of int (* 葉 *)
            | Node of tree_t * int * tree_t (* 節 *)
*)

(* 多相の木 *)
type 'a tree_t = Empty
               | Leaf of 'a
               | Node of 'a tree_t * 'a * 'a tree_t

(*
(* 連想木（association tree） *)
type ('a, 'b) tree_t = Empty
                     | Leaf of 'a * 'b
                     | Node of ('a, 'b) tree_t * 'a * 'b * ('a, 'b) tree_t
*)

(*
tree は
  - Empty            空の木、或いは
  - Leaf (n)         値が n の葉、或いは
  - Node (t1, n, t2) 左の木が t1、値が n、右の木が t2 であるような節
                     （t1 と t2 が自己参照のケース）
という形
*)
