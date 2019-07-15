#use "src/chapter18/price.ml"

(* 目的 : yasai_list を買ったときの値段の合計を調べる *)
(* total_price : string list -> (string * int) list -> int *)
let rec total_price yasai_list yaoya_list =
  (* int option 型を返す *)
  let rec hojo yasai_list =
    match yasai_list with
    | [] -> Some (0)
    | first :: rest ->
      match price first yaoya_list with
      | None -> None (* 一つでも買えない野菜がある場合は None を返す *)
      | Some (p) ->
        match hojo rest with
        | None -> None
        | Some (q) -> Some (p + q) in
  (* int 型に変換 *)
  match hojo yasai_list with
  | None -> 0
  | Some (p) -> p

let test1 = total_price ["たまねぎ"; "にんじん"] yaoya_list = 350
let test2 = total_price ["たまねぎ"; "じゃがいも"; "にんじん"] yaoya_list = 0
