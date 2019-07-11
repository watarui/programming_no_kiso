#use "src/chapter10/gakusei_t.ml";;

(* 目的 : initから始めて lst の要素を右から順に f に施し込む *)
(* fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b *)
(* cf. List.fold_right *)
let rec fold_right f lst init  =
  match lst with
  | [] -> init
  | first :: rest ->
    f first (fold_right f rest init)

let add_int a b = a + b
let sum lst = fold_right add_int lst 0

let add_one a b = 1 + b
let length lst = fold_right add_one lst 0

let cons a b = a :: b
let append lst1 lst2 = fold_right cons lst1 lst2

let cat a b = a ^ b
let concat lst = fold_right cat lst ""

let add_tensuu a b =
  match a with
  | {namae = n; tensuu = t; seiseki = s} -> t + b

(* 目的 : gakusei_t型のリストを受け取り、全員の得点の合計を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum lst = List.fold_right add_tensuu lst 0

let test1 = gakusei_sum [gakusei1] = 70
let test2 = gakusei_sum [gakusei1; gakusei2] = 155
let test3 = gakusei_sum [gakusei1; gakusei2; gakusei3] = 235
