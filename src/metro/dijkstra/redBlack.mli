(* 赤黒木のモジュール *)

(* 木を表す型 *)
type ('a, 'b) t

(* 空の木 *)
val empty : ('a, 'b) t

(* 目的 : tree にキー k、値 v を挿入した木を返す *)
val insert : ('a, 'b) t -> 'a -> 'b -> ('a, 'b) t

(* 目的 : tree から k の value を探索して返す。ない場合は Not_found を投げる *)
val search : ('a, 'b) t -> 'a -> 'b

val traverse : ('a -> 'b -> 'c -> 'a) -> 'a -> ('b, 'c) t -> 'a

val length : ('a, 'b) t -> int
