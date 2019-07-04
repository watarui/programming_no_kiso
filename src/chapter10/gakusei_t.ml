(* 学生一人分のデータを表わす型 *)
type gakusei_t = {
  namae : string; (* 名前 *)
  tensuu : int; (* 点数 *)
  seiseki : string; (* 成績 *)
}

let gakusei1 = {
  namae = "asai";
  tensuu = 70;
  seiseki = "B";
}
let gakusei2 = {
  namae = "kaneko";
  tensuu = 85;
  seiseki = "A";
}
let gakusei3 = {
  namae = "yoshida";
  tensuu = 80;
  seiseki = "A";
}
