    type church_numeral = (int -> int) -> int -> int;;

    (* i2c recursively applies a function f to a parameter x n times *)

    let rec i2c : int -> church_numeral = fun i f x ->
    match i with
     0 -> x
    |i -> f (i2c (i - 1) f x);;

 (* passes the incrementing function and 0 into the Church numeral, so
   every application of f increases the output by 1. Since it starts
   at 0, this just returns the amount of times f was applied to x,
   thus telling us which Church numeral it was. *)

    let c2i : church_numeral -> int =
    fun cn -> cn ((+) 1) 0 ;;
