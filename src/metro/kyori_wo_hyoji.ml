#use "src/metro/romaji_to_kanji.ml"
#use "src/metro/get_ekikan_kyori.ml"

(* 目的 : ローマ字の駅名を２つ受け取ってきたら、その間の距離を調べ、直接つながっている場合は「A駅からB駅までは○kmです」という文字列を返し、つながっていない場合は「A駅とB駅はつながっていません」という文字列を返す *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji eki1 eki2 =
  let (e1, e2) = (romaji_to_kanji eki1 global_ekimei_list, romaji_to_kanji eki2 global_ekimei_list) in
  if e1 = "" && e2 = ""
  then eki1 ^ "、" ^ eki2 ^ "という駅は存在しません"
  else if e1 = ""
  then eki1 ^ "という駅は存在しません"
  else if e2 = ""
  then eki2 ^ "という駅は存在しません"
  else let kyori = (get_ekikan_kyori e1 e2 global_ekikan_list) in
    if kyori < infinity
    then e1 ^ "駅から" ^ e2 ^ "駅までは" ^ string_of_float kyori ^ "kmです"
    else e1 ^ "駅から" ^ e2 ^ "駅まではつながっていません"

(* test *)
let test1 = kyori_wo_hyoji "omotesandou" "nogizaka" = "表参道駅から乃木坂駅までは1.4kmです"
let test2 = kyori_wo_hyoji "kokkaigijidoumae" "akasaka" = "国会議事堂前駅から赤坂駅までは0.8kmです"
let test3 = kyori_wo_hyoji "shibuya" "senkawa" = "渋谷駅から千川駅まではつながっていません"
let test4 = kyori_wo_hyoji "yokohama" "akasaka" = "yokohamaという駅は存在しません"
let test5 = kyori_wo_hyoji "akasaka" "yokohama" = "yokohamaという駅は存在しません"
let test6 = kyori_wo_hyoji "yokohama" "osaka" = "yokohama、osakaという駅は存在しません"
