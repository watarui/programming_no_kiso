(* 駅と駅の接続情報を格納するレコード型 *)
type ekikan_t = {
    kiten : string; (* 始点の駅名（漢字） *)
    shuten : string; (* 終点の駅名（漢字） *)
    keiyu : string; (* 経由する路線名（漢字） *)
    kyori : float; (* 2駅間の距離km *)
    jikan : int; (* 所要時間m *)
}
