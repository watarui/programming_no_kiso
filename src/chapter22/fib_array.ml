(* 目的 : 配列を与えられたら、そこにフィボナッチ数を順に入れた配列を返す *)
let fib_array a =
  let l = Array.length a in
  let rec fib n =
    if n < l
    then
      begin
        if n = 0 || n = 1
        then a.(n) <- n
        else a.(n) <- a.(n - 1) + a.(n - 2);
        fib (n + 1)
      end
    else () in
  begin
    fib 0;
    a;
  end

let test1 = fib_array [|0; 0; 0; 0; 0; 0; 0; 0; 0; 0|] = [|0; 1; 1; 2; 3; 5; 8; 13; 21; 34|]
