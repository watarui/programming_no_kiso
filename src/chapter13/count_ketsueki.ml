#use "src/chapter8/person_t.ml"

let lst1 = person1 :: []
let lst2 = person1 :: person2 :: []
let lst3 = person1 :: person2 :: person3 :: []
let lst4 = person1 :: person2 :: person3 :: person4 :: []

(* 目的 : person_t 型のデータのリストを受け取ったら、指定された血液型の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki lst blood =
  match lst with
    [] -> 0
  | {name = n; height = h; weight = w; birthday = bi; blood = bl} :: rest ->
    if bl = blood
    then 1 + count_ketsueki rest blood
    else count_ketsueki rest blood

(* test *)
let test1 = count_ketsueki lst1 "A" = 0
let test2 = count_ketsueki lst2 "A" = 0
let test3 = count_ketsueki lst3 "A" = 1
let test4 = count_ketsueki lst4 "A" = 2
