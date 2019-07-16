#use "src/chapter20/insert.ml";;

(* 目的 : 赤黒木とキーを受け取り、キーに対応する値を返す *)
(* search : ('a, 'b) rb_tree_t -> 'a -> 'b *)
let rec search tree key =
  match tree with
  | Empty -> raise Not_found
  | Node (l, k, v, c, r) ->
    if key = k then v
    else if key < k then search l key
    else search r key

let test1 = search tree5 1 = "a"
let test2 = search tree5 10 = "b"
let test3 = search tree5 5 = "c"
let test4 = search tree5 7 = "d"
