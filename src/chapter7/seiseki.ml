(* 目的 : 名前と成績の組を受け取ったら、「○○さんの評価は△です」という文字列を返す *)
(* seiseki : string * string -> string *)
let seiseki (name, evaluation) =
    match (name, evaluation) with
        (n, e) -> n ^ "さんの評価は" ^ e ^ "です"

(* test *)
let test1 = seiseki ("田中", "普通") = "田中さんの評価は普通です"
let test2 = seiseki ("鈴木", "良") = "鈴木さんの評価は良です"

(*
# #use "src/chapter7/seiseki.ml" ;;
val seiseki : string * string -> string = <fun>
val test1 : bool = true
val test2 : bool = true
*)
