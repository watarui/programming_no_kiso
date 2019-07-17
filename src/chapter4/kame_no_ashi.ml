(* 亀の数xを与えられたら、脚の本数を返す *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * 4

(* test *)
let test1 = kame_no_ashi 2 = 8
let test2 = kame_no_ashi 3 = 12
let test3 = kame_no_ashi 10 = 40

(*
# #use "src/chapter4/kame_no_ashi.ml" ;;
val kame_no_ashi : int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
