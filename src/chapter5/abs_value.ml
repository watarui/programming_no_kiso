(* 目的 : 受け取った実数xの絶対値を計算する *)
(* abs_value : float -> float *)
let abs_value x =
    if x > 0.0 then x
               else -. x

(* test *)
let test1 = abs_value 2.8 = 2.8
let test2 = abs_value (-2.8) = 2.8
let test3 = abs_value 0.0 = 0.0

(*
# #use "src/chapter5/abs_value.ml" ;;
val abs_value : float -> float = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
