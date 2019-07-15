#use "src/chapter18/price.ml"

(* 目的 : yasai_list を買ったときの値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
let rec total_price yasai_list yaoya_list =
  match yasai_list with
  | [] -> 0
  | first :: rest ->
    price first yaoya_list + total_price rest yaoya_list

let test1 = total_price ["たまねぎ"; "にんじん"] yaoya_list = 350
let test2 = total_price ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list <> 0 (* すべての野菜が買える前提なので 0 にはならない *)
