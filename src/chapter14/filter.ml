#use "src/chapter9/count_A.ml";;

let rec filter_positive lst =
  match lst with
  | [] -> []
  | first :: rest ->
    if first > 0
    then first :: filter_positive rest
    else filter_positive rest

let rec filter_mod3_1 lst =
  match lst with
  | [] -> []
  | first :: rest ->
    if first mod 3 = 1
    then first :: filter_mod3_1 rest
    else filter_mod3_1 rest

(* filter : ('a -> bool) -> 'a list -> 'a list *)
(* cf. List.filter *)
let rec filter p lst =
  match lst with
  | [] -> []
  | first :: rest ->
    if p first
    then first :: filter p rest
    else filter p rest

let is_even n = n mod 2 = 0

let even lst = filter is_even lst

let test1 = even [] = []
let test1 = even [0] = [0]
let test2 = even [1; 2] = [2]
let test4 = even [1; 2; 4; 6; 7] = [2; 4; 6]

let is_A g =
  match g with
  | {namae = n; tensuu = t; seiseki = s} ->
    s = "A"

let count_A lst = List.length (filter is_A lst)

let test1 = count_A lst1 = 0
let test2 = count_A lst2 = 0
let test3 = count_A lst3 = 1
let test4 = count_A lst4 = 2
