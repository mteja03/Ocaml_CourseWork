(* implement the function *)
let curry : (('a * 'b) -> 'c) -> 'a -> 'b -> 'c =
  fun f a b -> f (a,b);;
(*Takes a function and 2 arguments and applies the arguments to the function *)
(* implement the function *)
let uncurry : ('a -> 'b -> 'c) -> ('a * 'b) -> 'c =
  fun f (a,b) -> f a b  ;;
  (* opposite of curry function, uncurry takes curry function *)
