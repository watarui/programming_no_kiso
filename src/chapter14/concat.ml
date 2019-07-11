(* infix関数をprefix関数として使う *)
(* concat : string list -> string *)
let concat lst = List.fold_right (^) lst ""

let test1 = concat [] = ""
let test2 = concat [""] = ""
let test3 = concat ["a"] = "a"
let test4 = concat ["a"; "b"] = "ab"
