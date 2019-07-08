(* 目的 : 予め昇順に並んでいる整数のリストlstと整数nを受け取ったら、lstを先頭から見て順に見ていき、昇順となる位置にnを挿入したリストを返す *)
(* insert : int * list int -> int * list *)
let rec insert lst n =
  match lst with
  | [] -> [n]
  | first :: rest ->
    if first > n
    then n :: lst
    else first :: insert rest n

(* test *)
let test1 = insert [] 0 = [0]
let test2 = insert [1; 3; 4; 7; 8] 0 = [0; 1; 3; 4; 7; 8]
let test3 = insert [1; 3; 4; 7; 8] 5 = [1; 3; 4; 5; 7; 8]
let test4 = insert [1; 3; 4; 7; 8] 10 = [1; 3; 4; 7; 8; 10]
