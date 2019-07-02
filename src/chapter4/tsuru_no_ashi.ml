(* 鶴の数xを与えられたら、脚の本数を返す *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2

(* test *)
let test1 = tsuru_no_ashi 2 = 4
let test2 = tsuru_no_ashi 3 = 6
let test3 = tsuru_no_ashi 10 = 20

(*
# #use "src/chapter4/tsuru_no_ashi.ml" ;;
val tsuru_no_ashi : int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
