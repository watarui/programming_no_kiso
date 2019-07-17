let twice f x =
  let g x = f (f x)
  in g

(* aa : 'a -> 'a *)
let aa a = a

(* aba : 'a -> 'b -> 'a *)
let aba a b = a

(* abb : 'a -> 'b -> 'b *)
let abb a b = b

(* aabb : 'a -> ('a -> 'b) -> 'b *)
let aabb x f = f x

(* abbcac : ('a -> 'b) -> ('b -> 'c) -> 'a -> 'c *)
let abbcac f g h = g (f h)
