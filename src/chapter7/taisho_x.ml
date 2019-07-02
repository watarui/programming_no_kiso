(* 目的 : x座標とy座標の組で表された平面座標を受け取ったら、x軸について対称な点の座標を返す *)
(* taisho_x : float * float -> float * float *)
let taisho_x coordinate = match coordinate with
    (x, y) -> (+. x, -. y)

(* test *)
let test1 = taisho_x (0., 0.) = (0., 0.)
let test2 = taisho_x (3., 5.) = (3., -5.)
let test3 = taisho_x (3., -5.) = (3., 5.)

(*
# #use "src/chapter7/taisho_x.ml" ;;
val taisho_x : float * float -> float * float = <fun>
val test1 : bool = true
val test2 : bool = true
val test3 : bool = true
*)
