(* 各人の情報を格納するレコード *)
type person_t = {
    height : float; (* 身長m *)
    weight : float; (* 体重kg *)
    birthday : string; (* 誕生日（月と日） *)
    blood : string; (* 血液型 *)
}

type person1 = {
    height : 180.0;
    weight : 77.7;
    birthday : "0624";
    blood : "AB";
}

type person2 = {
    height : 166.6;
    weight : 66.6;
    birthday : "1111";
    blood : "O";
}

type person3 = {
    height : 175.4;
    weight : 81.0;
    birthday : "0229";
    blood : "A";
}
