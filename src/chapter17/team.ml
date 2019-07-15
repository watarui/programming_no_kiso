(* 赤組か白組かを表すバリアント型 *)
(* Red, White は構成子（constructor）と呼ぶ *)
type team_t = Red | White

let team_string team =
  match team with
  | Red -> "赤組"
  | White -> "白組"

let test1 = team_string Red = "赤組"
let test2 = team_string White = "白組"
