#use "src/chapter8/person_t.ml"

let lst1 = person1 :: []
let lst2 = person1 :: person2 :: []
let lst3 = person1 :: person2 :: person3 :: []
let lst4 = person1 :: person2 :: person3 :: person4 :: []

(* 目的 : person_t 型のデータのリストを受け取ったら、血液型がA型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_a lst =
  match lst with
    [] -> 0
  | {name = n; height = h; weight = w; birthday = bi; blood = bl} :: rest ->
      if bl = "A"
      then 1 + count_ketsueki_a rest
      else count_ketsueki_a rest

(* test *)
let test1 = count_ketsueki_a lst1 = 0
let test2 = count_ketsueki_a lst2 = 0
let test3 = count_ketsueki_a lst3 = 1
let test4 = count_ketsueki_a lst4 = 2
