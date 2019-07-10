#use "src/metro/ekimei_t.ml"
     #use "src/metro/eki_t.ml"

(* 目的 : ekimei_t型のリストを受け取ったら、その駅名を使ってeki_t型のリストを作る *)
(* make_eki_list : ekimei_t * list -> eki_t * list *)
let rec make_eki_list lst =
  match lst with
  | [] -> []
  | {kanji = kanji; kana = kana; romaji = romaji; shozoku = shozoku} :: rest ->
    {namae = kanji; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest

(* test *)
let test1 = make_eki_list [] = []
let test2 = make_eki_list [{kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}] = [{namae="池袋"; saitan_kyori=infinity; temae_list=[]}]
let test3 = make_eki_list [
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="新大塚"; kana="しんおおつか"; romaji="shinotsuka"; shozoku="丸ノ内線"}
  ] = [
              {namae="池袋"; saitan_kyori=infinity; temae_list=[]};
              {namae="新大塚"; saitan_kyori=infinity; temae_list=[]};
            ]
