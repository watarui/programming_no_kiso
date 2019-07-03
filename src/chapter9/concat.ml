(* 目的 : 文字列のリストを受け取ったら、その中の要素を前から順に全部、くっつけた文字列を返す *)
(* concat : string list -> string *)
let rec concat lst =
  match lst with
    [] -> ""
  | first::rest -> first ^ concat rest

(* test *)
let test1 = concat [""] = ""
let test1 = concat [""; ""] = ""
let test2 = concat ["O"; "Caml"] = "OCaml"
let test4 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
