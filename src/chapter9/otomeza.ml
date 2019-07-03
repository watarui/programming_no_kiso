#use "src/chapter8/person_t.ml"

let lst1 = person1 :: []
let lst2 = person1 :: person2 :: []
let lst3 = person1 :: person2 :: person3 :: []
let lst4 = person1 :: person2 :: person3 :: person4 :: []

(* 目的 : person_t 型のデータのリストを受け取ったら、乙女座の人の数を返す *)
(* otomeza : person_t list -> string list *)
let rec otomeza lst =
  match lst with
    [] -> []
  | {name = n; height = h; weight = w; birth_month = bm; birth_day = bd; blood = bl} :: rest ->
      if (bm = 8 && 23 <= bd) || (bm = 9 && bd <= 22)
      then n :: otomeza rest
      else otomeza rest

(* test *)
let test1 = otomeza lst1 = []
let test2 = otomeza lst2 = []
let test3 = otomeza lst3 = ["ota"]
let test4 = otomeza lst4 = ["ota"; "oya"]
