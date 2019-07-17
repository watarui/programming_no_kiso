(* ヒープの添字の型 *)
type index_t = int ref

(* ヒープの型 *)
(* 'a : 最小値を求める値 'b : その他の付加情報 *)
type ('a, 'b) t = int ref * (index_t * 'a * 'b) array

(* 新しいヒープを作る *)
(* 使い方 : create size key value *)
val create : int -> 'a -> 'b -> ('a, 'b) t

(* ヒープにデータを挿入する（破壊的） *)
val insert : ('a, 'b) t -> 'a -> 'b -> index_t * ('a, 'b) t

(* ヒープの index 番目の要素を返す *)
(* 使い方 : get heap index *)
val get : ('a, 'b) t -> index_t -> 'a * 'b

(* ヒープの index 番目の値を更新したヒープを返す（破壊的） *)
(* 使い方 : set heap index key value *)
val set : ('a, 'b) t -> index_t -> 'a -> 'b -> ('a, 'b) t

(* 最小の値を持つものとそれを取り除いたヒープの組を返す（破壊的） *)
(* 使い方 : split_top heap *)
val split_top : ('a, 'b) t -> ('a * 'b) * ('a, 'b) t
