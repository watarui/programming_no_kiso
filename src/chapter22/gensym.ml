(* 文字列を受け取ったら、その文字列が呼ばれるごとに異なる数字を付けた文字列を返す *)
(* gensym : string -> string *)
(* 参照型 ref を用いる *)
let count = ref (-1)
let gensym string =
  begin
    count := !count + 1;
    string ^ string_of_int !count;
  end

let test1 = gensym "a" = "a0"
let test2 = gensym "a" = "a1"
let test3 = gensym "x" = "x2"
