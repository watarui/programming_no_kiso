#use "src/chapter10/ins_sort.ml"
#use "src/chapter10/gakusei_t.ml"

(* tensuu順 : gakusei1 < gakusei3 < gakusei2 *)
let lst1 = [gakusei1]
let lst2 = [gakusei1; gakusei2]
let lst3 = [gakusei1; gakusei2; gakusei3]

(* 目的 : tensuuが昇順となる位置にgakuseiを挿入する *)
(* gakusei_insert : gakusei_t list -> gakusei_t -> gakusei_t list *)
let rec gakusei_insert lst gakusei =
  match lst with
  | [] -> [gakusei]
  | {namae = n; tensuu = t; seiseki = s} as g :: rest ->
    match gakusei with
    {namae = ng; tensuu = tg; seiseki = sg} ->
    if tg < t
    then gakusei :: lst
    else g :: gakusei_insert rest gakusei

(* 目的：受け取った学生のリスト lst を点数の順に並べる *)
(* gakusei_ins_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort lst = match lst with
    [] -> []
  | first :: rest -> gakusei_insert (gakusei_sort rest) first

(* test *)
let test0 = gakusei_sort [] = []
let test1 = gakusei_sort lst1 = [gakusei1]
let test2 = gakusei_sort lst2 = [gakusei1; gakusei2]
let test3 = gakusei_sort lst3 = [gakusei1; gakusei3; gakusei2]

