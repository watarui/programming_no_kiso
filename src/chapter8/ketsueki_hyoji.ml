#use "src/chapter8/person_t.ml"

(* 目的 : person_t型のデータを受け取ったら「○○さんの血液型は△型です」という形の文字列を返す *)
(* ketsueki_hyoji : person_t -> string *)
let ketsueki_hyoji person =
    match person with
        {
            name = n;
            height = h;
            weight = w;
            birthday = b;
            blood = bl;
        } -> n ^ "さんの血液型は" ^ bl ^ "型です"

(* test *)
let test1 = ketsueki_hyoji person1 = "okaさんの血液型はAB型です"
let test2 = ketsueki_hyoji person2 = "odaさんの血液型はO型です"
let test3 = ketsueki_hyoji person3 = "otaさんの血液型はA型です"

(*
type person_t = {
  name : string;
  height : float;
  weight : float;
  birthday : string;
  blood : string;
}
val person1 : person_t =
  {name = "oka"; height = 180.; weight = 77.7; birthday = "0624";
   blood = "AB"}
val person2 : person_t =
  {name = "oda"; height = 166.6; weight = 66.6; birthday = "1111";
   blood = "O"}
val person3 : person_t =
  {name = "ota"; height = 175.4; weight = 81.; birthday = "0229";
   blood = "A"}
val ketsueki_hyoji : person_t -> string = <fun>
val test1 : bool = true
val test1 : bool = true
val test1 : bool = true
*)
