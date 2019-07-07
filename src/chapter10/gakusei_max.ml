#use "src/chapter10/gakusei_t.ml"

(* tensuu順 : gakusei1 < gakusei3 < gakusei2 *)
let lst1 = [gakusei1]
let lst2 = [gakusei1; gakusei2]
let lst3 = [gakusei1; gakusei2; gakusei3]

(* 目的 : gakusei_t型のリストを受け取り、その中から最高得点を取った人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst =
  match lst with
  | [] -> {namae = ""; tensuu = min_int; seiseki = ""}
  | {namae = n; tensuu = t; seiseki = s} as g :: rest ->
    let g_max = gakusei_max rest in
    match g_max with
    {namae = n_max; tensuu = t_max; seiseki = s_max} ->
    if t_max < t
    then g
    else g_max

(* test *)
let test1 = gakusei_max lst1 = gakusei1
let test2 = gakusei_max lst2 = gakusei2
let test3 = gakusei_max lst2 = gakusei2
