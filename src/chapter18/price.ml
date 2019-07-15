(*
(* オプション型 *)
type ' option = None
              | Some of 'a
*)

let yaoya_list = [("トマト", 300); ("たまねぎ", 200); ("にんじん", 150); ("ほうれん草", 200)]

(* price : string -> (string * int) list -> int option *)
let rec price item lst =
  match lst with
  | [] -> 0
  | (yasai, nedan) :: rest -> if item = yasai then nedan else price item rest

let test1 = price "たまねぎ" yaoya_list = 200
let test2 = price "じゃがいも" yaoya_list = 0
