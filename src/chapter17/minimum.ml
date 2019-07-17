(* 目的 : 受け取った整数とlstの最小値を返す *)
(* minimum : int -> int list -> int *)
let rec minimum' n lst =
  match lst with
  | [] -> n
  | first :: rest ->
    let min_rest = minimum' n rest in
    if first <= min_rest
    then first
    else min_rest

let minimum lst =
  match lst with
  | [] -> max_int
  | first :: rest -> minimum' first rest

(* test *)
let test1 = minimum [3] = 3
let test2 = minimum [1; 2] = 1
let test3 = minimum [3; 2] = 2
let test4 = minimum [3; 2; 6; 4; 1; 8] = 1
