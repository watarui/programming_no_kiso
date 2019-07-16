#use "src/chapter20/rb_tree_t.ml";;

(*
      Zb        Zb      Xb        Xb             Yr
     / \       / \     / \       / \           /   \
    Yr  D     Xr  D   A   Zr    A   Yr        Xb    Zb
   / \       / \         / \       / \       / \   / \
  Xr  C     A   Yr      Yr  D     B   Zr    A   B C   D
 / \           / \     / \           / \
A   B         B   C   B   C         C   D
*)

(* 目的 : 赤黒木の赤の連続をなくす *)
(* balance : ('a, 'b) rb_tree_t -> ('a, 'b) rb_tree_t *)
let balance tree =
  match tree with
  | Node (Node (Node (a, xl, xr, Red, b), yl, yr, Red, c), zl, zr, Black, d)
  | Node (Node (a, xl, xr, Red, Node (b, yl, yr, Red, c)), zl, zr, Black, d)
  | Node (a, xl, xr, Black, Node (Node (b, yl, yr, Red, c), zl, zr, Red, d))
  | Node (a, xl, xr, Black, Node (b, yl, yr, Red, Node (c, zl, zr, Red, d)))
    -> Node (Node (a, xl, xr, Black, b), yl, yr, Red, Node (c, zl, zr, Black, d))
  | _ -> tree

let tree1 = Node (Node (Node (Empty, "xl", "xr", Red, Empty), "yl", "yr", Red, Empty), "zl", "zr", Black, Empty)
let tree2 = Node (Node (Empty, "xl", "xr", Red, Node (Empty, "yl", "yr", Red, Empty)), "zl", "zr", Black, Empty)
let tree3 = Node (Empty, "xl", "xr", Black, Node (Node (Empty, "yl", "yr", Red, Empty), "zl", "zr", Red, Empty))
let tree4 = Node (Empty, "xl", "xr", Black, Node (Empty, "yl", "yr", Red, Node (Empty, "zl", "zr", Red, Empty)))
let tree5 = Node (Node (Empty, "xl", "xr", Black, Empty), "yl", "yr", Red, Node (Empty, "zl", "zr", Black, Empty))

let test1 = balance tree1 = tree5
let test2 = balance tree2 = tree5
let test3 = balance tree3 = tree5
let test4 = balance tree4 = tree5
let test5 = balance tree5 = tree5
