(*
エラストステネスの篩
自然数 n 以下の素数をすべて求めるアルゴリズム。
1. 2 から n までの自然数のリストを作る
2. リストの先頭の要素は素数である
3. リストの残りの中からリストの先頭の要素で割り切れるのものは取り除く
4. 2. 以降をリストが空になるまで繰り返す
*)

(* 目的 : 2以上n以下の自然数のリストを受け取り、2以上n以下の素数のリストを返す *)
(* sieve : int list -> int list *)
let rec sieve lst =
  match lst with
  | [] -> []
  | first :: rest -> first :: sieve (List.filter (fun x -> x mod first <> 0) rest)

(* rest は減少していき [] で停止する *)

let test1 = sieve [2] = [2]
let test2 = sieve [2; 3; 4; 5] = [2; 3; 5]
let test3 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7]

(* 目的 : 自然数を受け取ったら、それ以下の素数のリストを返す *)
(* prime : int -> int list *)
let prime n =
  (* m以上n以下の自然数のリストを返す *)
  let rec enum m = if m <= n then m :: enum (m + 1) else [] in
  sieve (enum 2)

let test4 = prime 2 = [2]
let test5 = prime 6 = [2; 3; 5]
let test6 = prime 10 = [2; 3; 5; 7]
