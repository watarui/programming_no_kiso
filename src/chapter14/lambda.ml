#use "src/chapter8/person_t.ml";;

let test1 = (fun x -> x * x - 1) 3 = 8
let test2 = (fun x -> match x with {name = n;} -> n) person1 = "oka"
