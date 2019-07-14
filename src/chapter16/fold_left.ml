(* fold_left f init [1; 2; 3; 4; 5] = f (f (f (f (f init 1) 2) 3) 4) 5 *)
(* fold_right f [1; 2; 3; 4; 5] init = f 1 (f 2 (f 3 (f 4 (f 5 init)))) *)
let rec fold_left f init lst =
  match lst with
  | [] -> init
  | first :: rest -> fold_left f (f init first) rest

let test1 = fold_left (^) "" [] = ""
let test2 = fold_left (^) "i" ["a"; "b"] = "iab"
