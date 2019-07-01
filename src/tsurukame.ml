(* 鶴と亀の数の合計xと足の数の合計yを与えられたら、鶴の数を返す *)
(* tsurukame : int -> int -> int *)
let tsurukame x y = x * 2 - y / 2

(* test *)
let test1 = tsurukame 3 8 = 2
let test2 = tsurukame 7 22 = 3
let test3 = tsurukame 20 60 = 10

(*
# #use "src/tsurukame.ml" ;;
val tsurukame : int -> int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
