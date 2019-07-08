#use "src/metro/ekikan_t.ml"
#use "src/metro/global_ekikan_list.ml"

(* 目的 : 漢字の駅名を２つ（いずれも文字列）と駅間リスト（ekikan_t list型）を受け取り、駅間リストの中からその2駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekimei_t list -> float *)
let rec get_ekikan_kyori eki1 eki2 lst =
  match lst with
  | [] -> infinity
  | {kiten = ki; shuten = s; keiyu = ke; kyori = ky; jikan = j} :: rest ->
    if (eki1 = ki && eki2 = s) || (eki1 = s && eki2 = ki)
    then ky
    else get_ekikan_kyori eki1 eki2 rest

(* test *)
let test1 = get_ekikan_kyori "表参道" "乃木坂" global_ekikan_list = 1.4
let test2 = get_ekikan_kyori "国会議事堂前" "赤坂" global_ekikan_list = 0.8
let test3 = get_ekikan_kyori "表参道" "横浜" global_ekikan_list = infinity
let test4 = get_ekikan_kyori "横浜" "赤坂" global_ekikan_list = infinity
