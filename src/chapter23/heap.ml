(*
ヒープソート（heap sort）
計算量は O(nlog n)
破壊的操作を伴うので参照透過性がない
*)

(* ヒープの添字の型 *)
type index_t = int ref

(* ヒープの型 *)
(* 'a : 最小値を求める値 'b : その他の付加情報 *)
type ('a, 'b) t = int ref * (index_t * 'a * 'b) array

(* insert 時にヒープがいっぱいであることを示す例外 *)
exception Full

(* split_top 時にヒープが空であることを示す例外 *)
exception Empty

(* 新しいヒープを作る *)
(* 使い方 : create size key value *)
(* val create : int -> 'a -> 'b -> ('a, 'b) t *)
(* Array.make n x は x で初期化された、長さ n の新規配列を返します。 *)
let create size key value = (ref 0, Array.make size (ref (-1), key, value))

(* array の index1 と index2 を入れ替える *)
let swap array index1 index2 =
  let (i1, v1, attr1) as a1 = array.(index1) in
  let (i2, v2, attr2) as a2 = array.(index2) in
  begin
    array.(index1) <- a2;
    array.(index2) <- a1;
    i1 := index2;
    i2 := index1;
  end

(* 子方向に再帰的に入れ替え *)
let rec adjust_child n array index =
  if index >= n
  then ()
  else
    let (_, v, _) = array.(index) in
    let ci1 = 2 * index + 1 in (* left child *)
    let ci2 = ci1 + 1 in (* right child *)
    if ci1 >= n
    then ()
    else
      let (_, v1, _) = array.(ci1) in
      if ci2 >= n
      then
        if v1 <= v
        then
          begin
            swap array index ci1;
            adjust_child n array ci1;
          end
        else ()
      else
        let (_, v2, _) = array.(ci2) in
        if v < v1 && v <= v2
        then ()
        else if v1 < v2
        then (* v1 <= v *)
          begin
            swap array index ci1;
            adjust_child n array ci1;
          end
        else (* v2 <= v *)
          begin
            swap array index ci2;
            adjust_child n array ci2;
          end

(* 親方向に再帰的に入れ替え *)
let rec adjust_parent array index =
  if index = 0
  then ()
  else
    let (_, v, _) = array.(index) in
    let pi = (index - 1) / 2 in (* 親のインデックス *)
    let (_, pv, _) = array.(pi) in
    if v < pv (* 親の値のほうが大きければ *)
    then
      begin
        swap array index pi;
        adjust_parent array pi;
      end
    else ()

(* ヒープにデータを挿入する（破壊的） *)
(* val insert : ('a, 'b) t -> 'a -> 'b -> index_t * ('a, 'b) t *)
let insert (h_ref, array) r a =
  let idx = !h_ref in
  if idx >= Array.length array
  then raise Full
  else let i = ref idx in
    begin
      array.(idx) <- (i, r, a);
      adjust_parent array idx;
      (i, (idx + 1, array));
    end

(* ヒープの index 番目の要素を返す *)
let get (h_ref, array) i_ref =
  if 0 <= !i_ref && !i_ref < !h_ref
  then
    let (_, a, b) = array.(!i_ref) in
    (a, b)
  else raise Not_found

(* ヒープの index 番目の値を更新したヒープを返す（破壊的） *)
let set (h_ref, array) i_ref v attr =
  let (_, iv, _) = array.(!i_ref) in
  begin
    array.(!i_ref) <- (i_ref, v, attr);
    if v < iv
    then adjust_parent array !i_ref
    else adjust_child !h_ref array !i_ref;
    (h_ref, array);
  end

(* 最小の値を持つものとそれを取り除いたヒープの組を返す（破壊的） *)
(* 使い方 : split_top heap *)
(* val split_top : ('a, 'b) t -> ('a * 'b) * ('a, 'b) t *)
let split_top (h_ref, array) =
  if !h_ref = 0
  then raise Empty
  else let (i_ref, v, attr) = array.(0) in
    begin
      h_ref := !h_ref - 1;
      array.(0) <- array.(!h_ref);
      adjust_child !h_ref array 0;
      i_ref := -1; (* 取り出した先頭の要素の無効化 *)
      ((v, attr), (h_ref, array));
    end

(* ヒープのデータ数を返す *)
let length (r, _) = !r
