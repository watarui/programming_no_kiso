#use "src/chapter8/person_t.ml"

let lst1 = person1 :: []
let lst2 = person1 :: person2 :: []
let lst3 = person1 :: person2 :: person3 :: []
let lst4 = person1 :: person2 :: person3 :: person4 :: []

(* 目的 : person_t型のデータからnameを返す *)
(* get_name : person_t -> string *)
let get_name person =
  match person with
  | {name = n} -> n

(* 目的 : person_t 型のデータのリストを受け取ったら、nameのリストを返す *)
(* person_name : person_t list -> string -> string list *)
let rec person_name persons =
  List.map get_name persons

(* test *)
let test0 = person_name [] = []
let test1 = person_name lst1 = ["oka"]
let test2 = person_name lst2 = ["oka"; "oda"]
let test3 = person_name lst3 = ["oka"; "oda"; "ota"]
let test4 = person_name lst4 = ["oka"; "oda"; "ota"; "oya"]
