#use "src/chapter8/person_t.ml"

(* name順 : person2 < person1 < person3 < person4 *)
let lst1 = [person1]
let lst2 = [person1; person2]
let lst3 = [person1; person2; person3]
let lst4 = [person1; person2; person3; person4]

(* 目的 : nameが昇順となる位置にpersonを挿入する *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert lst person =
  match lst with
  | [] -> [person]
  | {name = n; height = h; weight = w} as p :: rest ->
    match person with
    {name = np; height = hp; weight = wp} ->
    if np < n
    then person :: lst
    else p :: person_insert rest person

(* 目的 : person_t型のリストを受け取り、名前の順に整列したリストを返す *)
(* person_sort : person_t list -> person_t list *)
let rec person_sort lst = match lst with
    [] -> []
  | first :: rest -> person_insert (person_sort rest) first

(* test *)
let test0 = person_sort [] = []
let test1 = person_sort lst1 = [person1]
let test2 = person_sort lst2 = [person2; person1]
let test3 = person_sort lst3 = [person2; person1; person3]
let test4 = person_sort lst4 = [person2; person1; person3; person4]

