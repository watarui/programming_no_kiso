(* 目的 : 整数のリストを受け取ったら、そのリストの長さを返す *)
(* length : int list -> int *)
let rec length lst =
  match lst with
    [] -> 0
  | first::rest -> 1 + length rest

(* test *)
let test1 = length [] = 0
let test2 = length [1; 2] = 2
let test3 = length [2; 3; 5; 0] = 4
