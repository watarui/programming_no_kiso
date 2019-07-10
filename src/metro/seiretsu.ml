#use "src/metro/ekimei_t.ml"

(* 目的：昇順に並んでいる lst の正しい位置に ekimei を挿入する *)
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec ekimei_insert lst ekimei =
  match lst with
  | [] -> [ekimei]
  | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} as first :: rest ->
    match ekimei with
      {kanji = kj; kana = kn; romaji = r; shozoku = s} ->
      if kana = kn
      then ekimei_insert rest ekimei
      else if kana < kn
      then first :: ekimei_insert rest ekimei
      else ekimei :: lst


(* 目的 : ekimei_t型のリストを受け取り、それをひらがな順に整列し、更に駅の重複を取り除いたekimei_t型のリストを返す *)
(* seiretsu : ekimei_t * list -> ekimei_t * list *)
let rec seiretsu lst =
  match lst with
  | [] -> []
  | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} as first :: rest ->
    ekimei_insert (seiretsu rest) first

(* test *)
let test1 = seiretsu [] = []
let test2 = seiretsu [
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"};
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"};
    {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"};
    {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"};
    {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"}
  ] = [
              {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
              {kanji="御茶ノ水"; kana="おちゃのみず"; romaji="ochanomizu"; shozoku="丸ノ内線"};
              {kanji="後楽園"; kana="こうらくえん"; romaji="korakuen"; shozoku="丸ノ内線"};
              {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"};
              {kanji="本郷三丁目"; kana="ほんごうさんちょうめ"; romaji="hongosanchome"; shozoku="丸ノ内線"};
              {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}
            ]
