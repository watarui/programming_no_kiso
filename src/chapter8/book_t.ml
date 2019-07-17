(* 本に関する情報を格納するレコード型 *)
type book_t = {
    title : string; (* タイトル *)
    author : string; (* 著者 *)
    publisher : string; (* 出版社 *)
    price : int; (* 価格 *)
    isbn : string; (* ISBN *)
}

let book1 = {
    title = "book1";
    author = "yamada";
    publisher = "tokyo";
    price = 1000;
    isbn = "123";
}

let book2 = {
    title = "book1";
    author = "yamada";
    publisher = "tokyo";
    price = 1000;
    isbn = "123";
}

let book3 = {
    title = "book1";
    author = "yamada";
    publisher = "tokyo";
    price = 1000;
    isbn = "123";
}
