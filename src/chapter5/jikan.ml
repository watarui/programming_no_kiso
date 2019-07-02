(* 目的 : 時間x（0 - 24）kを受け取ったら午前か午後を返す *)
(* jikan : int -> string *)
let jikan x =
    if x < 12 then "午前" else "午後"

(* test *)
let test1 = jikan 9 = "午前"
let test2 = jikan 12 = "午後"
let test3 = jikan 23 = "午後"

(*
# #use "src/chapter5/jikan.ml" ;;
val jikan : int -> string = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
