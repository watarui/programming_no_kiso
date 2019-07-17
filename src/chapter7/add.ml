(* 目的 : 2つの整数の組pairを受け取りその要素の和を返す *)
(* add : int * int -> int *)
let add pair = match pair with
        (a, b) -> a + b

(* test *)
let test1 = add (0, 0) = 0
let test2 = add (3, 5) = 8
let test3 = add (3, -5) = -2

(*
# #use "src/chapter7/add.ml" ;;
val add : int * int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
