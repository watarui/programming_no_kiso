#use "src/metro/ekimei_t.ml";;

(* make_initial_eki_list : ekimei_t * list -> eki_t * list *)
let make_initial_eki_list ekimei_lst kiten =
  List.map (fun ekimei -> match ekimei with
        {kanji = k; kana = n; romaji = r; shozoku = s} ->
        if k = kiten
        then {namae = k; saitan_kyori = 0.; temae_list = [k]}
        else {namae = k; saitan_kyori = infinity; temae_list = []}
    )
    ekimei_lst

(* test *)
let test1 = make_initial_eki_list [] "茗荷谷" = []
let test2 = make_initial_eki_list [
    {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"};
    {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"};
  ] "茗荷谷" = [
              {namae="池袋"; saitan_kyori = infinity; temae_list = []};
              {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
            ]
