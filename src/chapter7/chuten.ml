(* 目的 : x座標とy座標の組で表された平面座標を2つ受け取ったら、その中点の座標を返す *)
(* chuten : (float * float) * (float * float) -> (float * float) * (float * float) *)
let chuten coordinates = match coordinates with
    ((a, b), (c, d)) -> ((a +. c) /. 2., (b +. d) /. 2.)

(* test *)
let test1 = chuten ((0., 0.), (0., 0.)) = (0., 0.)
let test2 = chuten ((3., 5.), (7., -11.)) = (5., -3.)
let test3 = chuten ((-3., -5.), (7., -11.)) = (2., -8.)

(*
# #use "src/chapter7/chuten.ml" ;;
val chuten : (float * float) * (float * float) -> float * float = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
