(* お小遣い帳の情報を格納するレコード *)
type okozukai_t = {
    name : string; (* 買ったものの名前 *)
    price : int; (* 値段 *)
    place : string; (* 買った場所 *)
    date : string; (* 日付 *)
}

let okozukai1 = {
    name = "ame";
    price = 100;
    place = "lowson";
    date = "20200701";
}

let okozukai2 = {
    name = "gum";
    price = 100;
    place = "seven";
    date = "20200702";
}

let okozukai3 = {
    name = "soba";
    price = 330;
    place = "family mart";
    date = "20200703";
}
