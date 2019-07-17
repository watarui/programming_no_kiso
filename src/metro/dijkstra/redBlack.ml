(* 赤黒木を表すモジュール *)

(* 赤か黒かを示す型 *)
type c = Red
       | Black

(* 各節に 'a 型のキーと 'b 型の値、c 型の値を持つ木の型 *)
type ('a, 'b) t = Empty
                | Node of ('a, 'b) t * 'a * 'b * c * ('a, 'b) t

(* 空の木 *)
let empty = Empty

(* 目的 : 赤黒木とキーと値を挿入して返す。挿入するキーが既に赤黒木に存在する場合は、その頂点の値を上書きする *)
(* insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t *)
let insert tree k v =
  let rec insert' tree =
    match tree with
    | Empty -> Node (Empty, k, v, Red, Empty)
    | Node (left, key, value, color, right) ->
      (* 目的 : 赤黒木の赤の連続をなくす *)
      (* balance : ('a, 'b) t -> ('a, 'b) t *)
      let balance tree =
        match tree with
        | Node (Node (Node (a, xl, xr, Red, b), yl, yr, Red, c), zl, zr, Black, d)
        | Node (Node (a, xl, xr, Red, Node (b, yl, yr, Red, c)), zl, zr, Black, d)
        | Node (a, xl, xr, Black, Node (Node (b, yl, yr, Red, c), zl, zr, Red, d))
        | Node (a, xl, xr, Black, Node (b, yl, yr, Red, Node (c, zl, zr, Red, d)))
          -> Node (Node (a, xl, xr, Black, b), yl, yr, Red, Node (c, zl, zr, Black, d))
        | _ -> tree in
      if k = key
      then Node (left, k, v, color, right)
      else if k < key
      then balance (Node (insert' left, key, value, color, right))
      else balance (Node (left, key, value, color, insert' right)) in
  match insert' tree with
  | Empty -> assert false
  | Node (left, key, value, color, right) -> Node (left, key, value, Black, right)

(* 目的 : 赤黒木とキーを受け取り、キーに対応する値を返す *)
(* search : ('a, 'b) t -> 'a -> 'b *)
let rec search tree key =
  match tree with
  | Empty -> raise Not_found
  | Node (l, k, v, c, r) ->
    if key = k then v
    else if key < k then search l key
    else search r key

(* 目的：全てのノードを深さ優先で訪れる *)
(* 初期値 init から始めて、各ノードで関数 f を順に適用する *)
(* traverse : ('a -> 'b -> 'c -> 'a) -> 'a -> ('b, 'c) t -> 'a *)
let rec traverse f init tree =
  match tree with
  | Empty -> init
  | Node (left, key, value, _, right) ->
      let result1 = f init key value in
      let result2 = traverse f result1 left in
      let result3 = traverse f result2 right in
        result3

(* 目的：木の中にあるノードの数を求める *)
(* length : ('a, 'b) t -> int *)
let rec length tree =
  match tree with
  | Empty -> 0
  | Node (left, key, value, _, right) ->
      length left + 1 + length right
