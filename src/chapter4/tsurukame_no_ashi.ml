(* 鶴の数xと亀の数yを与えられたら、脚の本数の合計を返す *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi x y = x * 2 + y * 4

(* test *)
let test1 = tsurukame_no_ashi 2 1 = 8
let test2 = tsurukame_no_ashi 3 4 = 22
let test3 = tsurukame_no_ashi 10 10 = 60

(*
# #use "src/chapter4/tsurukame_no_ashi.ml" ;;
val tsurukame_no_ashi : int -> int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
