(* 目的 : 現在の気温tが15以上25以下かどうかをチェックする *)
(* kaiteki : int -> bool *)
let kaiteki t =
    15 <= t && t <= 25

(* 目的 : 現在の気温tから快適度を表す文字列を計算する *)
(* kion : int -> string *)
let kion t =
    if kaiteki t then "快適" else "普通"

(* test *)
let test1 = kaiteki 7 = false
let test2 = kaiteki 15 = true
let test3 = kaiteki 20 = true
let test4 = kaiteki 25 = true
let test5 = kaiteki 28 = false

let test6 = kion 7 = "普通"
let test7 = kion 15 = "快適"
let test8 = kion 20 = "快適"
let test9 = kion 25 = "快適"
let test10 = kion 28 = "普通"

(*
#use "src/chapter5/kion.ml" ;;
val kaiteki : int -> bool = <fun>
val kion : int -> string = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
val test4 : bool = true
val test5 : bool = true
val test6 : bool = true
val test7 : bool = true
val test8 : bool = true
val test9 : bool = true
val test10 : bool = true
*)
