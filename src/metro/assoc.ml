(* 目的 : 連想リスト（association list）を検索して、その駅までの距離を返す *)
(* assoc : string -> (string * float) list -> float *)
let rec assoc str alst =
  match alst with
  | [] -> infinity
  | (k, v) :: rest -> if k = str then v else assoc str rest

let test1 = assoc "後楽園" [] = infinity
let test2 = assoc "後楽園" [("新大塚", 1.2); ("後楽園", 1.8)] = 1.8
let test3 = assoc "池袋" [("新大塚", 1.2); ("後楽園", 1.8)] = infinity
