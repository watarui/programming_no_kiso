(* 目的 : 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst =
  match lst with
    [] -> []
  | first::rest ->
      if first mod 2 = 1
      then even rest
      else first::even rest

(* test *)
let test1 = even [] = []
let test1 = even [0] = [0]
let test2 = even [1; 2] = [2]
let test4 = even [1; 2; 4; 6; 7] = [2; 4; 6]
