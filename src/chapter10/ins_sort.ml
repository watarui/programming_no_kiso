(* insert lst n *)
#use "src/chapter10/insert.ml"

(* 目的 : 整数のリストを受け取ったら、それを昇順に整列したリストを返す（挿入法） *)
(* ins_sort : int * list -> int * list *)
let rec ins_sort lst =
  match lst with
  | [] -> []
  | first :: rest ->
    insert (ins_sort rest) first

(* test *)
let test1 = ins_sort [] = []
let test2 = ins_sort [0] = [0]
let test3 = ins_sort [1; 3; 4] = [1; 3; 4]
let test4 = ins_sort [4; 3; 1] = [1; 3; 4]
let test5 = ins_sort [5; 3; 8; 1; 7; 4] = [1; 3; 4; 5; 7; 8]
