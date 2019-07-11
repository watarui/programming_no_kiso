(* 目的 : nから1までのリストを作る *)
(* enumerate : int -> int list *)
let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

let test1 = enumerate 5 = [5; 4; 3; 2; 1]
