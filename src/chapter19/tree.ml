(* 2 分探索木を表すモジュール *)
(* module Tree = struct *)
(* 2 分探索木を表す型 *)
type ('a, 'b) t = Empty
                | Node of ('a, 'b) t * 'a * 'b * ('a, 'b) t

(* 空の木 *)
let empty = Empty

(* 目的 : tree にキー k、値 v を挿入した木を返す *)
(* insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t *)
let rec insert tree k v =
  match tree with
  | Empty -> Node (Empty, k, v, Empty)
  | Node (left, key, value, right) ->
    if k = key then Node (left, key, v, right)
    else if k < key then Node (insert left k v, key, value, right)
    else Node (left, key, value, insert right k v)

(* 目的 : tree から k の value を探索して返す。ない場合は Not_found を投げる *)
(* search : ('a, 'b) t -> 'a -> 'b *)
let rec search tree k =
  match tree with
  | Empty -> raise Not_found
  | Node (left, key, value, right) ->
    if k = key then value
    else if k < key then search left k
    else search right k
(* end *)
