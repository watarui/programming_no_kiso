(* 年号を表すバリアント型 *)
(* 構成子に引数を持たせるには「構成子 of 型」とする *)
type nengou_t = Meiji of int
              | Taisho of int
              | Showa of int
              | Heisei of int
              | Reiwa of int

(* 目的 : 年号を受け取り、西暦を返す *)
(* to_seireki : nengou_t -> int *)
let to_seireki nengou =
  match nengou with
  | Meiji (n) -> n + 1867
  | Taisho (n) -> n + 1911
  | Showa (n) -> n + 1925
  | Heisei (n) -> n + 1925
  | Reiwa (n) -> n + 2018


(* 目的 : 誕生年と現在の年を nengou_t 型の値として受け取り、年齢を返す *)
(* nenrei : nengou_t -> nengou_t -> int *)
let nenrei birth_year present_year = to_seireki present_year - to_seireki birth_year

let test1 = nenrei (Showa (42)) (Reiwa (1)) = 52
