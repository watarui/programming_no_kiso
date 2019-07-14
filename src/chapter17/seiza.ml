(* 月を表すバリアント型 *)
type year_t = January of int
            | February of int
            | March of int
            | April of int
            | May of int
            | June of int
            | July of int
            | August of int
            | September of int
            | October of int
            | November of int
            | December of int

(* 12星座を表すバリアント型 *)
type seiza_t = Aries
             | Taurus
             | Gemini
             | Cancer
             | Leo
             | Virgo
             | Libra
             | Scorpius
             | Sagittarius
             | Capricornus
             | Aquarius
             | Pisces

(* 目的 : year_t 型の値を受け取り、seiza_t 型の星座を返す *)
(* seiza : year_t -> seiza_t *)
let seiza year =
  match year with
  | January (n) -> if n <= 19 then Capricornus else Aquarius
  | February (n) -> if n <= 18 then Aquarius else Pisces
  | March (n) -> if n <= 20 then Pisces else Aries
  | April (n) -> if n <= 19 then Aries else Taurus
  | May (n) -> if n <= 20 then Taurus else Gemini
  | June (n) -> if n <= 21 then Gemini else Cancer
  | July (n) -> if n <= 22 then Cancer else Leo
  | August (n) -> if n <= 22 then Leo else Virgo
  | September (n) -> if n <= 22 then Virgo else Libra
  | October (n) -> if n <= 23 then Libra else Scorpius
  | November (n) -> if n <= 22 then Scorpius else Sagittarius
  | December (n) -> if n <= 21 then Sagittarius else Capricornus

let test1 = seiza (June (21)) = Gemini
let test2 = seiza (June (22)) = Cancer
