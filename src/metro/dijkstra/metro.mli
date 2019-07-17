(* type ekimei_t *)
(* 駅名の情報を格納するレコード *)
type ekimei_t = {
    kanji : string; (* 漢字の駅名 *)
    kana : string; (* ひらがなの駅名 *)
    romaji : string; (* ローマ字の駅名 *)
    shozoku : string; (* その駅が所属する路線名 *)
}

(* 駅と駅の接続情報を格納するレコード型 *)
type ekikan_t = {
    kiten : string; (* 始点の駅名（漢字） *)
    shuten : string; (* 終点の駅名（漢字） *)
    keiyu : string; (* 経由する路線名（漢字） *)
    kyori : float; (* 2駅間の距離km *)
    jikan : int; (* 所要時間m *)
}

(* type ekikan_t *)
val global_ekimei_list : ekimei_t list
val global_ekikan_list : ekikan_t list
