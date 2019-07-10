#use "src/metro/eki_t.ml"

(* 目的 : eki_t型のリストと起点を受け取ったら、起点のsaitan_kyori=0., temae_list は始点の駅名からなるリストとなるようなeki_t型のリストを返す *)
(* shokika : eki_t * list -> eki_t * list *)
let rec shokika lst kiten =
  match lst with
  | [] -> []
  | {namae = namae; saitan_kyori = saitan_kyori; temae_list = temae_list} as first :: rest ->
    if namae = kiten
    then {namae = kiten; saitan_kyori = 0.; temae_list = [kiten]} :: shokika rest kiten
    else first :: shokika rest kiten

(* test *)
let test1 = shokika [] "茗荷谷" = []
let test2 = shokika [
    {namae="池袋"; saitan_kyori = infinity; temae_list = []};
  ] "茗荷谷" = [
              {namae="池袋"; saitan_kyori = infinity; temae_list = []};
            ]
let test3 = shokika [
    {namae="池袋"; saitan_kyori = infinity; temae_list = []};
    {namae="茗荷谷"; saitan_kyori = infinity; temae_list = []};
  ] "茗荷谷" = [
              {namae="池袋"; saitan_kyori = infinity; temae_list = []};
              {namae="茗荷谷"; saitan_kyori = 0.; temae_list = ["茗荷谷"]};
            ]
