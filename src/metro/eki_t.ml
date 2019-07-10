(* グラフの中の節（駅）を表すレコード型 *)
type eki_t = {
  namae : string; (* 駅名 *)
  saitan_kyori : float; (* 最短距離 *)
  temae_list : string list; (* 手前の駅名のリスト *)
}
