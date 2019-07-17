#use "src/chapter14/enumerate.ml";;

(* 目的 : nの約数のリストを返す *)
(* divisor : int -> int list *)
let divisor n = List.filter (fun x -> n mod x = 0) (enumerate n)

let test1 = divisor 5 = [5; 1]
let test2 = divisor 24 = [24; 12; 8; 6; 4; 3; 2; 1]
