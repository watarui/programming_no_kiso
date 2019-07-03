#use "src/metro/ekimei_t.ml"

(* ekimei_t型のデータを受け取り、「路線名、駅名（かな）」形式の文字列を返す *)
(* hyoji : ekimei_t -> string *)
let hyoji ekimei =
    match ekimei with
    {
        kanji = kanji;
        kana = kana;
        romaji = romaji;
        shozoku = shozoku;
    } -> shozoku ^ "、" ^ kanji ^ "（" ^ kana ^ "）"

(* test *)
let test1 = hyoji {
    kanji = "茗荷谷";
    kana = "みょうがだに";
    romaji = "myogadani";
    shozoku = "丸ノ内線";
    } = "丸ノ内線、茗荷谷（みょうがだに）"
