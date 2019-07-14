(* 目的 : リストの逆順を返す *)
(* reverse : 'a list -> 'a list *)
let reverse lst =
  (* リストの末尾に first を追加するやり方は計算量 O(n^2) となるので不利 *)
  (* 今までのリストを逆順にして返す *)
  let rec rev lst result =
    match lst with
    | [] -> result
    | first :: rest -> rev rest (first :: result) in
  rev lst []

let test1 = reverse [] = []
let test2 = reverse [1; 2] = [2; 1]
let test3 = reverse [2; 1] = [1; 2]
let test4 = reverse [1; 1] = [1; 1]
let test5 = reverse [1; 2; 3; 4; 5] = [5; 4; 3; 2; 1]
