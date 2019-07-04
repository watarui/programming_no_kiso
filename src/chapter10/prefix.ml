(* 目的 : 接頭語のリストを受け取ったら、各接頭語の先頭にもう一つの要素を付け加える補助関数 *)
(* add_to_each : int list * list = list * list *)
(*
let add_to_each n lst =
  match lst with
    [] -> []
  | first :: rest -> [] (* add_to_each n rest *)

let test4 = add_to_each 1 [[2]; [2; 3]; [2; 3; 4]] = [[1; 2]; [1; 2; 3]; [1; 2; 3; 4]]
のケースを考える。
first = [2]
rest = [[2; 3]; [2; 3; 4]]
であり、
add_to_each 1 rest = [[1; 2; 3]; [1; 2; 3; 4]]
となる。
つまり、add_to_each 1 rest の先頭に [1; 2] （n :: first）を加えれば目的を達成できる
*)
let rec add_to_each n lst =
  match lst with
    [] -> []
  | first :: rest -> (n :: first) :: add_to_each n rest

(* 目的 : 接頭語（先頭から任意の長さのところで切ったリスト。空リスト[]は含まず）を返す *)
(* prefix : list -> int * list * list *)
(*
let rec prefix lst =
  match lst with
    [] -> []
  | first :: rest -> [] (* prefix rest *)
let test8 = prefix [1; 2; 3; 4] = [[1]; [1; 2]; [1; 2; 3]; [1; 2; 3; 4]]
のケースを考える。
first = 1
rest = [2; 3; 4]
であり、
prefix rest = prefix [2; 3; 4] = [[2]; [2; 3]; [2; 3; 4]]
となる。
つまり、prefix rest の各接頭語の先頭に[1]（[first]）を加え、
全体のリストの先頭に[1]（[first]）を加えれば目的を達成できる
*)
let rec prefix lst =
  match lst with
    [] -> []
  | first :: rest -> (first :: []) :: add_to_each first (prefix rest)

(* test *)
let test1 = add_to_each 1 [] = []
let test2 = add_to_each 1 [[2]] = [[1; 2]]
let test3 = add_to_each 1 [[2]; [2; 3]] = [[1; 2]; [1; 2; 3]]
let test4 = add_to_each 1 [[2]; [2; 3]; [2; 3; 4]] = [[1; 2]; [1; 2; 3]; [1; 2; 3; 4]]
let test5 = prefix [] = []
let test6 = prefix [1] = [[1]]
let test7 = prefix [1; 2] = [[1]; [1; 2]]
let test8 = prefix [1; 2; 3; 4] = [[1]; [1; 2]; [1; 2; 3]; [1; 2; 3; 4]]
