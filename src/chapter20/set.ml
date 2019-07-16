module type Set_t = sig

  (* 要素の型が 'a の集合の型 *)
  type 'a t

  (* 空集合 *)
  val empty : 'a t

  (* 要素ひとつからなる集合 *)
  val singleton : 'a -> 'a t

  (* 和集合 *)
  val union : 'a t -> 'a t -> 'a t

  (* 共通部分 *)
  val inter : 'a t -> 'a t -> 'a t

  (* 差集合 *)
  val diff : 'a t -> 'a t -> 'a t

  (* 要素が集合に入っているか *)
  val mem : 'a -> 'a t -> bool

end

module Set : Set_t = struct

  type 'a t = 'a list

  let empty = []

  let singleton elm = [elm]

  let union set1 set2 = set1 @ set2

  let mem elm set = List.mem elm set

  let inter set1 set2 = List.filter (fun x -> mem x set2) set1

  (* set1 から set2 の要素を除いた集合 *)
  let diff set1 set2 = List.filter (fun x -> not (mem x set2)) set1

end
