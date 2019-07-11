#use "src/chapter14/enumerate.ml";;

(* 目的 : 階乗を求める *)
(* fac : int -> int *)
let fac n = List.fold_right ( * ) (enumerate n) 1

let test1 = fac 1 = 1
let test2 = fac 5 = 120
