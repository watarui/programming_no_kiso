#use "src/chapter10/ketsueki_shukei.ml"

let max a b =
  if a >= b
  then a
  else b

(* 目的 : person_t list から、4つの血液型のうち最も人数の多かった血液型を返す *)
(* saita_ketsueki : person_t list -> string *)
let saita_ketsueki lst =
  let (a, b, o, ab) = ketsueki_shukei lst in
  let ketsueki_max = max a (max b (max o ab)) in
  if ketsueki_max = a then "A"
  else if ketsueki_max = b then "B"
  else if ketsueki_max = o then "O"
  else "AB"

(* test *)
let test1 = saita_ketsueki lst1 = "AB"
let test2 = saita_ketsueki lst2 = "O"
let test3 = saita_ketsueki lst3 = "A"
let test4 = saita_ketsueki lst4 = "A"
