(* 目的 : 誕生日（月xと日y）を受け取ったら、星座を返す *)
(*
おひつじ座 3/21～4/19
おうし座 4/20～5/20
ふたご座 5/21～6/21
かに座 6/22～7/22
しし座 7/23～8/22
おとめ座 8/23～9/22
てんびん座 9/23～10/23
さそり座 10/24～11/22
いて座 11/23～12/21
やぎ座 12/22～1/19
みずがめ座 1/20～2/18
うお座 2/19～3/20
*)
(* seiza : int -> string *)
let seiza x =
    if x < 12 then "午前" else "午後"

(* test *)
let test1 = seiza 9 = "午前"
let test2 = seiza 12 = "午後"
let test3 = seiza 23 = "午後"

(*
# #use "src/chapter5/seiza.ml" ;;
val seiza : int -> string = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
