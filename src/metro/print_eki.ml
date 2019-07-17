#use "src/metro/eki_t.ml";;

(* 目的 : eki_t 型の値をきれいに表示するk *)
(* print_eki : eki_t -> unit *)
let print_eki eki =
  match eki with
    {namae = n; saitan_kyori = s; temae_list = t} ->
    match t with
    | [] -> assert false
    | [a] ->
      begin
        print_string ("駅名 : " ^ a);
        print_newline ();
        print_string ("最短距離 : " ^ string_of_float s ^ "km");
        print_newline ();
      end
    | first :: rest ->
      begin
        print_string "駅のリスト : ";
        (* fold_right f [1; 2; 3; 4; 5] init = f 1 (f 2 (f 3 (f 4 (f 5 init)))) *)
        (* fold_right で f を適用する第二引数を捨てる。fold_right 自体の第三引数は print_string に合わせて unit 型にする *)
        List.fold_right (fun x y -> print_string (x ^ " -> ")) rest ();
        print_string first;
        print_newline ();
        print_string ("最短距離 : " ^ string_of_float s ^ "km");
        print_newline ();
      end

let test1 = print_eki
    {
      namae = "東京";
      saitan_kyori = 7.4;
      temae_list = ["東京"; "銀座"; "霞ヶ関"; "国会議事堂前"; "赤坂"; "乃木坂"; "表参道"; "渋谷"]
    }
