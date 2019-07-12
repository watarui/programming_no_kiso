(* 目的 : 級数の第n項を求める *)
(* dai_n_kou : int -> float *)
let rec dai_n_kou n =
  if n = 0
  then 1.0
  else dai_n_kou (n - 1) /. float_of_int n

(* 目的 : eの近似値を求める *)
(* e : int -> float *)
let rec e n =
  let d = dai_n_kou n in
  if d < 0.00001
  then d
  else d +. e (n + 1)

(*
e 0 = d(0) + e(1)
    = d(0) + d(1) + e(2)
    = d(0) + d(1) + ... + d(m-1) + e(m)
    = d(0) + d(1) + ... + d(m-1) + d(m) (d(m) < 0.00001)
*)
let test1 = e 0 = 2.71828152557319225
