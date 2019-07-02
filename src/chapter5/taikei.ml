(* 目的 : 身長x(m)と体重y(kg)を与えられたら、BMI指数（体重を身長の2乗で割る）を返す *)
(* bmi : float -> float -> float *)
let bmi x y =
    y /. (x ** 2.)

(* 目的 : 身長x(m)と体重y(kg)を与えられたら、BMI指数を計算し、その数値によって体型を返す *)
(* taikei : float -> float -> string *)
let taikei x y =
    if bmi x y < 18.5 then "痩せ"
    else if bmi x y < 25. then "標準"
    else if bmi x y < 30. then "肥満"
    else "重度肥満"

(* test *)
let test1 = bmi 1.77 81. = 25.854639471416256
let test2 = bmi 1.60 50. = 19.5312499999999964
let test3 = bmi 1.90 50. = 13.8504155124653749
let test4 = bmi 1.70 90. = 31.1418685121107295

let test5 = taikei 1.77 81. = "肥満"
let test6 = taikei 1.60 50. = "標準"
let test7 = taikei 1.90 50. = "痩せ"
let test7 = taikei 1.70 90. = "重度肥満"

(*
# #use "src/chapter5/taikei.ml" ;;
val bmi : float -> float -> float = <fun>
val yase : float -> bool = <fun>
val hyoujyun : float -> bool = <fun>
val himan : float -> bool = <fun>
val jyudo_himan : float -> bool = <fun>
val taikei : float -> float -> string = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
val test4 : bool = true
val test5 : bool = true
val test6 : bool = true
val test7 : bool = true
val test7 : bool = true
*)
