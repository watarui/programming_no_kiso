#use "src/chapter16/distance_t.ml";;

(*
accumulator（情報を蓄積、累算しているもの）
欠落している情報を補うような引数
*)

(* 目的 : 先頭からリスト中の各店までの距離の合計を計算する *)
(* total_distance : distance_t list -> distance_t list *)
let rec total_distance lst =
  (* total0 :  これまでの距離の合計 *)
  (* hojo : distance_t list -> float -> distance_t list *)
  let rec hojo lst total0 =
    match lst with
    | [] -> []
    | {kyori = k; total = t} :: rest ->
      {kyori = k; total = total0 +. k} :: hojo rest (total0 +. k) in
  hojo lst 0.0

let test1 =
  total_distance [
    {
      kyori = 0.3;
      total = 0.;
    };
    {
      kyori = 0.9;
      total = 0.;
    };
    {
      kyori = 1.4;
      total = 0.;
    };
    {
      kyori = 0.8;
      total = 0.;
    }
  ]

(*
# #use "src/chapter16/total_distance.ml";;
type distance_t = { kyori : float; total : float; }
val total_distance : distance_t list -> distance_t list = <fun>
val test1 : distance_t list =
  [{kyori = 0.3; total = 0.3}; {kyori = 0.9; total = 1.2};
   {kyori = 1.4; total = 2.59999999999999964};
   {kyori = 0.8; total = 3.39999999999999947}]
*)
