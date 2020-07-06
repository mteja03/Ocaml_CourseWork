type complex_number = CI of int*int;;

(* implementations *)

(* addition of two Complex Integers *)
(* A Type is declered so, CI(x,y) represents x+yi and CI(x2,y2) represents x2+y2i.
     function cadd will add thes both inputs and returs a output *)
let cadd (CI(x,y)) (CI(x2,y2)) =
  CI((x+x2),(y+y2)) ;;

(* multiplication of two Complex Integers *)
(*A Type is declered so, CI(x,y) represents x+yi and CI(x2,y2) represents x2+y2i.
     function cmult will multiply thes both inputs and returs a two output *)
let cmult (CI(x,y)) (CI(x2,y2)) =
  CI(((x*x2)-(y*y2)),((y*x2)+(x*y2))) ;;

