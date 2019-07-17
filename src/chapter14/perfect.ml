#use "src/chapter14/enumerate.ml";;
#use "src/chapter14/divisor.ml";;

(* 目的 : m以下の完全数のリストを返す *)
(* perfect : int -> int list *)
let perfect m =
  List.filter (fun n -> List.fold_right (+) (divisor n) 0 - n = n) (enumerate m)
let test1 = perfect 5 = []
let test2 = perfect 10000 = [8128; 496; 28; 6]
