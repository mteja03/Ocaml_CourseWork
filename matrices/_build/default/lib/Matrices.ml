
(* declaration of types intseq and intmatrix *)

type intseq = int list;;

type intmatrix = IM of intseq list;;

(* useful for debugging *)
let string_of_row row =
  String.concat ""
    (List.map (fun x -> string_of_int x ^ " ") row);;

(* useful for debugging *)
let rec string_of_matrix m =
  match m with
          [] -> ""
      | [[]] -> ""
      | (row::rest) ->
         string_of_row row ^ "\n" 
         ^ string_of_matrix rest;;

(* function getbody to retrieve the body of the intmatrix which is of type intseq list *)
let getbody (IM x) = x;;

(*ismatrix helper function *)
let rec rows : intseq -> int = fun row -> 
match row with 
[] -> 0
| [x] -> 1
| (x::rest) -> 1 + (rows rest) ;;

(*matrixshape halper function *)
let rec columns : intmatrix -> int =
fun matrix -> match matrix with 
    IM[] -> 0
  | IM [[_]] -> 1
  | IM (row::rest) -> 1 + columns (IM rest);;

(* test whether a list of lists of integers represents a matrix. 
   The length of each row should be equal.*)
let rec ismatrix : intmatrix -> bool = fun matrix ->
match matrix with 
      IM [] -> true
    | IM [[_]] -> true
    | IM (r1::r2::rest) -> 
      if(rows r1 = rows r2)
      then ismatrix (IM rest)
      else false;;

  

(* function matrixshape takes the matrix, and calculates the number of
   columns and rows *)
let matrixshape : intmatrix -> int * int =
fun matrix -> match matrix with 
    IM [[]] -> (0,1)
    | IM [] ->(0,0)
    | IM (row::rest) -> ((rows row), (columns matrix));;

(*matrixadd helper function*)
let rec addrow : intseq -> intseq ->intseq =
fun xs ys -> match xs, ys with 
[], _ -> []
| _, [] -> []
| (x::x_rest), (y::y_rest) ->
  (x+y) :: (addrow x_rest y_rest);;    

(* matrix addition *)
let rec matrixadd : intmatrix -> intmatrix -> intmatrix =
  fun xm ym -> match xm, ym with
  IM [], IM [] -> IM []
  | IM [[]], IM [[]] -> IM [[]]
  | IM (x::x_rest), IM (y::y_rest) ->
    IM ((addrow x y) :: (getbody (matrixadd (IM x_rest) (IM y_rest))));;

(* it multiplies two inteseqs and returns an integer *)
let rec mul_intseqs: intseq -> intseq -> int =
  fun intseq1 intseq2 ->
    match intseq1, intseq2 with
      [x1], [x2] -> ( x1 * x2 )
      | (h1::rest1), (h2::rest2) -> ( h1 * h2 ) + (mul_intseqs rest1 rest2)
      | _, _ -> 0;;


(* it multiplies an intseq by a intseq list and returns a intseq *)
let rec mult_intseq_by_intseqlist: intseq -> intseq list -> intseq =
  fun intseq intseqlist ->
    match intseqlist with
      [row] -> [mul_intseqs intseq row]
      | (headrow::rest) -> (mul_intseqs intseq headrow) :: (mult_intseq_by_intseqlist intseq rest) ;;

(* multiply two intseq lists and returns a single intseq list *)
let rec mul_intseqlists: intseq list -> intseq list -> intseq list =
  fun intseq1 intseq2 ->
    match intseq1 with
      [row] -> [mult_intseq_by_intseqlist row intseq2]
      | (headrow::rest) -> ( mult_intseq_by_intseqlist headrow intseq2) :: (mul_intseqlists rest intseq2) ;;


(* matrix multiplication *)
let matrixmult x y =
  match x, y with
    IM [], IM [] -> IM []
    | IM [[]], IM [[]] -> IM [[]]
    | IM integerseq1, IM integerseq2 -> IM ( mul_intseqlists integerseq1 integerseq2 ) ;;
             
