
open Essay ;;
open OUnit2;;

(* unit tests   
 This tests are designated value as input values to test and the function and make sure the output is correct
 This tests use values, I have choosen to specifically test the function 'add', I used a postive number to check wether its adding or not*)
let add_test1 _test_ctxt =
  assert_equal 9 (add 5 4);;

let add_test2 _test_ctxt =
  assert_equal 20 (add 15 5);;

 let add_test3 _test_ctxt =
  assert_equal 100 (add 50 50);; 

(* list of unit tests *)
let unit_tests =
  [ "add_test1">::add_test1
    ;"add_test2">::add_test2
    ;"add_test2">::add_test3
  ];;
 

(* property based tests 
  This test will tests adding zero and two from the value x, 1000 times each *)

let add_zero =
  QCheck.Test.make ~name:"seqmult_zeros" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
      add x 0 = x 
      && add 0 x = x);;

let add_two =
  QCheck.Test.make ~name:"add_two" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
      add x 2 = x+2
      && add 2 x = x+2);;      

let add_fifty =
  QCheck.Test.make ~name:"add_two" ~count:1000
    QCheck.(make Gen.nat)
    (fun x ->
      add x 50 = x+50
      && add 50 x = x+50);; 
      
(* list of all property tests 
  where you would add all the property based tests created above that you want to run in main test block below*)                  
let property_tests =
  List.map QCheck_ounit.to_ounit2_test
    [ add_zero
    ;add_two
    ;add_fifty
    ];;


(* run the unit and property based tests *)
let () =
  run_test_tt_main
    ("sequence_arithmetic_tests">:::
       (List.append unit_tests property_tests));;


