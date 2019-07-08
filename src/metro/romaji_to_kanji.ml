#use "src/metro/ekimei_t.ml"
#use "src/metro/global_ekimei_list.ml"

(* 目的 : ローマ字の駅名（文字列）と駅名リスト（ekimei_t list 型）を受け取ったら、その駅の漢字表記を文字列で返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji ekimei lst =
  match lst with
  | [] -> ""
  | {kanji = kj; kana = ka; romaji = r; shozoku = s} :: rest ->
    if ekimei = r
    then kj
    else romaji_to_kanji ekimei rest

(* test *)
let test1 = romaji_to_kanji "hibiya" global_ekimei_list = "日比谷"
let test2 = romaji_to_kanji "akasaka" global_ekimei_list = "赤坂"
let test3 = romaji_to_kanji "yokohama" global_ekimei_list = ""
