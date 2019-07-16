#use "src/chapter20/balance.ml";;

(*
赤黒木（red-black tree）はバランス木（balanced tree）の一種
  定義1. 赤黒木の全てのパスにおいて、黒の数は同じ
  定義2. 赤の子は黒（親子で赤は連続しない）

赤黒木に赤の頂点を追加する場合、
  定義1. は自明
  定義2. について
    木が空 -> 赤の頂点で置き換え
           -> 親が赤の場合
           -> 親の頂点で対応
    木が空ではない -> 2 分探索木の要領で頂点を追加
                   -> 親が赤の場合
                   -> 親の頂点で対応

  頂点を追加後、その親が赤である場合は、親を赤、子を黒とするように変換する
  上記を根に向かって再帰的に適用
  最後、根を黒にする
*)

(* 目的 : 赤黒木とキーと値を挿入して返す。挿入するキーが既に赤黒木に存在する場合は、その頂点の値を上書きする *)
(* insert : ('a, 'b) rb_tree_t -> 'a -> 'b -> ('a, 'b) rb_tree_t *)
let insert tree k v =
  let rec insert' tree =
    match tree with
    | Empty -> Node (Empty, k, v, Red, Empty)
    | Node (left, key, value, color, right) ->
      if k < key
      then balance (Node (insert' left, key, value, color, right))
      else balance (Node (left, key, value, color, insert' right)) in
  match insert' tree with
  | Empty -> assert false
  | Node (left, key, value, color, right) -> Node (left, key, value, Black, right)

let tree1 = Empty
let tree2 = insert tree1 1 "a"
let tree3 = insert tree2 10 "b"
let tree4 = insert tree3 5 "c"
let tree5 = insert tree4 7 "d"

let test2 = tree2 = Node (Empty, 1, "a", Black, Empty)
let test3 = tree3 = Node (Empty, 1, "a", Black, Node (Empty, 10, "b", Red, Empty))
let test4 = tree4 = Node (Node (Empty, 1, "a", Black, Empty), 5, "c", Black, Node (Empty, 10, "b", Black, Empty))
let test5 = tree5 = Node (Node (Empty, 1, "a", Black, Empty), 5, "c", Black, Node (Node (Empty, 7, "d", Red, Empty), 10, "b", Black, Empty))
