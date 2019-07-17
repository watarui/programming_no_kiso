#use "src/chapter8/person_t.ml"

let lst1 = [person1]
let lst2 = [person1; person2]
let lst3 = [person1; person2; person3]
let lst4 = [person1; person2; person3; person4]

(* 目的 : person_t list から、各血液型の人数を集計する *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei lst =
  match lst with
  | [] -> (0, 0, 0, 0)
  | {blood = bl} :: rest ->
    let (a, b, o, ab) = ketsueki_shukei rest in
    if bl = "A"
    then (a + 1, b, o, ab)
    else if bl = "B"
    then (a, b + 1, o, ab)
    else if bl = "O"
    then (a, b, o + 1, ab)
    else (a, b, o, ab + 1)

(* test *)
let test1 = ketsueki_shukei lst1 = (0, 0, 0, 1)
let test2 = ketsueki_shukei lst2 = (0, 0, 1, 1)
let test3 = ketsueki_shukei lst3 = (1, 0, 1, 1)
let test4 = ketsueki_shukei lst4 = (2, 0, 1, 1)
