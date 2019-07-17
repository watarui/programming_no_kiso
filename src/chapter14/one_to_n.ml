#use "src/chapter14/enumerate.ml";;

(* 目的 : 1から受け取った自然数nまでの合計を求める *)
(* one_to_n : int -> int list *)
let one_to_n n = List.fold_right (+) (enumerate n) 0

let test1 = one_to_n 1 = 1
let test2 = one_to_n 100 = 5050
