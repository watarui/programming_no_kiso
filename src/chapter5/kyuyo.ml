(* 優遇時給: 円 *)
let yugu_jikyu = 980

(* 時給: 円 *)
let jikyu = 950

(* 基本給: 円 *)
let kihonkyu = 100

(* 働いた時間xに応じたアルバイト代を計算する *)
(* kyuyo : int -> int *)
let kyuyo x =
    kihonkyu + x * (if x < 30 then jikyu else yugu_jikyu)
    (*
    if x < 30 then kihonkyu + x * jikyu
              else kihonkyu + x * yugu_jikyu
              *)

(* test *)
let test1 = kyuyo 25 = 23850
let test2 = kyuyo 28 = 26700
let test3 = kyuyo 31 = 30480

(*
# #use "src/chapter5/kyuyo.ml" ;;
val yugu_jikyu : int = 980
val jikyu : int = 950
val kihonkyu : int = 100
val kyuyo : int -> int = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
