(* 目的 : 2以上n以下の自然数のリストを受け取り、2以上n以下の素数のリストを返す *)
(* sieve : int list -> int list *)
let rec sieve lst =
  begin
    print_int (List.length lst);
    print_newline ();
    match lst with
    | [] -> [];
    | first :: rest -> first :: sieve (List.filter (fun x -> x mod first <> 0) rest)
  end

(* rest は減少していき [] で停止する *)

let test1 = sieve [2] = [2]
let test2 = sieve [2; 3; 4; 5] = [2; 3; 5]
let test3 = sieve [2; 3; 4; 5; 6; 7; 8; 9; 10] = [2; 3; 5; 7]
