let compose f g =
  let h x = f (g x)
  in h

let time2 x = x * 2
let add3 x = x + 3

let test1 = (compose time2 add3) 4 = 14
