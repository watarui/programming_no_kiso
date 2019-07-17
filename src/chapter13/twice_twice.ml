
let add2 x = x + 2
let times3 x = x * 3

(* twice : ('a -> 'a) -> 'a -> 'a *)
let twice f =
  let g x = f (f x)
  in g

(* twice_twice : ('a -> 'a) -> 'a -> 'a *)
let twice_twice x = twice twice x

let test1 = (twice add2) 3 = 7
let test2 = (twice_twice add2) 3 = 11
let test3 = (twice_twice times3) 4 = 324
