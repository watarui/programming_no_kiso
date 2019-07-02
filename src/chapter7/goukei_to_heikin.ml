(* 目的 : 国語、数学、英語、理科、社会の5教科の得点を与えられたら、その合計点を返す *)
(* sum : int -> int -> int -> int -> int -> int *)
let sum a b c d e =
    a + b + c + d + e

(* 目的 : 国語、数学、英語、理科、社会の5教科の得点を与えられたら、その合計点と平均点を組にして返す *)
(* goukei_to_heikin : int -> int -> int -> int -> int -> int * int *)
let goukei_to_heikin a b c d e =
    (sum a b c d e, (sum a b c d e) / 5)

(* test *)
let test1 = goukei_to_heikin 100 100 100 100 100 = (500, 100)
let test2 = goukei_to_heikin 0 0 0 0 0 = (0, 0)
let test3 = goukei_to_heikin 20 40 60 80 100 = (300, 60)

(*
# #use "src/chapter7/goukei_to_heikin.ml" ;;
val sum : int -> int -> int -> int -> int -> int = <fun>
val goukei_to_heikin : int -> int -> int -> int -> int -> int * int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
