#use "src/chapter18/price.ml"

let rec has_yasai yasai yaoya_list =
  match yaoya_list with
  | [] -> false
  | (k, v) :: rest -> if yasai = k then true else has_yasai yasai rest

let rec count_urikire_yasai yasai_list yaoya_list =
  match yasai_list with
  | [] -> 0
  | first :: rest ->
    if (has_yasai first yaoya_list)
    then count_urikire_yasai rest yaoya_list
    else 1 + count_urikire_yasai rest yaoya_list

let test1 = count_urikire_yasai ["たまねぎ"] yaoya_list = 0
let test2 = count_urikire_yasai ["たまねぎ"; "じゃがいも"] yaoya_list = 1
