(* 目的 : 2次方程式ax^2+bx+c=0の係数a, b, c （いずれも実数 a /= 0）を与えられたら、判別式b^2-4acの値を返す *)
(* hanbetsushiki : float -> float -> float -> float *)
let hanbetsushiki a b c =
    b ** 2. -. 4. *. a *. c

(* 目的 : 2次方程式ax^2+bx+c=0の係数a, b, c （いずれも実数 a /= 0）を与えられたら、解の個数を返す *)
(* kai_no_kosuu : float -> float -> float -> int *)
let kai_no_kosuu a b c =
    if hanbetsushiki a b c < 0. then 0
                                else if hanbetsushiki a b c = 0. then 1
                                                                 else 2

(* 目的 : 2次方程式が虚数解を持つかどうか判定する *)
(* kyosuukai : float -> float -> float -> bool *)
let kyosuukai a b c =
    hanbetsushiki a b c < 0.

(* test *)
let test1 = hanbetsushiki 1. 2. 3. = -8.
let test2 = hanbetsushiki 2. 3. 1. = 1.
let test3 = hanbetsushiki 1. 2. 1. = 0.

let test4 = kai_no_kosuu 1. 2. 3. = 0
let test5 = kai_no_kosuu 2. 3. 1. = 2
let test6 = kai_no_kosuu 1. 2. 1. = 1

let test7 = kyosuukai 1. 2. 3. = true
let test8 = kyosuukai 2. 3. 1. = false
let test9 = kyosuukai 1. 2. 1. = false

(*
# #use "src/chapter5/hanbetsushiki.ml" ;;
val hanbetsushiki : float -> float -> float -> float = <fun>
val kai_no_kosuu : float -> float -> float -> int = <fun>
val kyosuukai : float -> float -> float -> bool = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
val test4 : bool = true
val test5 : bool = true
val test6 : bool = true
val test7 : bool = true
val test8 : bool = true
val test9 : bool = true
*)
