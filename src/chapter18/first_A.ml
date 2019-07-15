#use "src/chapter8/person_t.ml"

(* 目的 : リストからA型の人のレコードを返す *)
(* first_A : person_t list -> person_t option *)
let rec first_A lst =
  match lst with
  | [] -> None
  | ({blood = b}) as p :: rest -> if b = "A" then Some (p) else first_A rest

let test1 = first_A [person1] = None
let test2 = first_A [person1; person2; person3; person4] = Some (person3)
