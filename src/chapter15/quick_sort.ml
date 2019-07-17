(* 目的 : 受け取った lst をクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst =
  (* 補助関数 *)
  let take n lst prefix = List.filter (fun x -> prefix x n) lst in
  let take_less n lst = take n lst (<) in
  let take_greater n lst = take n lst (>=) in

  match lst with
  | [] -> [] (* 自明に答えが出るケース *)
  | first :: rest -> quick_sort (take_less first rest)
                     @ [first]
                     @ quick_sort (take_greater first rest)

let test1 = quick_sort [] = []
let test2 = quick_sort [1] = [1]
let test3 = quick_sort [1; 2] = [1; 2]
let test4 = quick_sort [2; 1] = [1; 2]
let test5 = quick_sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9]

let test6 = quick_sort [1; 1] = [1; 1] (* take_greaterのprefixを>=として対応 *)
