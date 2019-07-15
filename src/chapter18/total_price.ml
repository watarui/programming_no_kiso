#use "src/chapter18/price.ml"

(* 目的 : yasai_list を買ったときの値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
let total_price yasai_list yaoya_list =
  let rec hojo yasai_list =
    match yasai_list with
    | [] -> 0
    | first :: rest ->
      price first yaoya_list + hojo rest in
  try hojo yasai_list with
  | Urikire -> 0

let test1 = total_price ["たまねぎ"; "にんじん"] yaoya_list = 350
let test2 = total_price ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 0
