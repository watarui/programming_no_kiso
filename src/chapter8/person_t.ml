(* 各人の情報を格納するレコード *)
type person_t = {
    name : string; (* 名前 *)
    height : float; (* 身長m *)
    weight : float; (* 体重kg *)
    birthday : string; (* 誕生日（月と日） *)
    birth_month : int; (* 誕生日（月） *)
    birth_day : int; (* 誕生日（日） *)
    blood : string; (* 血液型 *)
}

let person1 = {
    name = "oka";
    height = 180.0;
    weight = 77.7;
    birthday = "0624";
    birth_month = 6;
    birth_day = 24;
    blood = "AB";
}

let person2 = {
    name = "oda";
    height = 166.6;
    weight = 66.6;
    birthday = "1111";
    birth_month = 11;
    birth_day = 11;
    blood = "O";
}

let person3 = {
    name = "ota";
    height = 175.4;
    weight = 81.0;
    birthday = "0824";
    birth_month = 8;
    birth_day = 24;
    blood = "A";
}

let person4 = {
    name = "oya";
    height = 155.8;
    weight = 55.5;
    birthday = "0901";
    birth_month = 9;
    birth_day = 1;
    blood = "A";
}
