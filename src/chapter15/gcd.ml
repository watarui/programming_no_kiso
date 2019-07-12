(*
ユークリッドの互除法
２つの自然数 m, n の最大公約数を求めるアルゴリズム。
入力は m >= n >= 0 となる自然数 m, n を定義。
1. n = 0 ならば m が最大公約数
2. そうでないならば n と、「 m を n で割った余り」の最大公約数が求める最大公約数
*)

(* 目的 : ２つの自然数を受け取ったら、その最大公約数を返す *)
(* gcd : int -> int -> int *)
let rec gcd m n =
  if n = 0
  then m
  else gcd n (m mod n) (* n > (m mod n) は自明 *)

(* n は減少していき 0 で停止する *)

let test1 = gcd 6 0 = 6
let test2 = gcd 3 2 = 1
let test3 = gcd 6 3 = 3
let test4 = gcd 10000 3 = 1
