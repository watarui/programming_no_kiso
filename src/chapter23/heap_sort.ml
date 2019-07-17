(* ./heap.top で起動したインタプリタ内で実行 *)

#use "heap.ml";;

(*
ヒープソートの手順
1. 空のヒープを用意する
2. リストの要素を一つずつ順にヒープに挿入する
3. ヒープから最小の要素を一つずつ順に取り出してリストに入れる
*)
(* 目的 : リストをヒープソートで降順に並び替える *)
let heap_sort lst =
  match lst with
  | [] -> []
  | first :: rest ->
    let size = List.length lst in
    let heap = List.fold_left
        (fun heap x ->
           let (_, h) = Heap.insert heap x () in
           h)
        (Heap.create size first ())
        lst in
    let rec heap_to_lst heap lst =
      try
        let ((v, attr), heap) = Heap.split_top heap in
        heap_to_lst heap (v :: lst)
      with
      | Heap.Empty -> lst in
    heap_to_lst heap []

let test1 = heap_sort [] = []
let test2 = heap_sort [1] = [1]
let test3 = heap_sort [1; 2] = [2; 1]
let test4 = heap_sort [2; 1] = [2; 1]
let test5 = heap_sort [5; 3; 8; 1; 7; 4] = [8; 7; 5; 4; 3; 1]
