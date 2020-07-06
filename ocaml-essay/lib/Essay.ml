(* Write an essay on the ML type system.  Be clear, to-the-point, and concise.  Convince your 
 * marker that you understand:
 *)                                                                                
 


 (* - Function types .
         Function in OCaml is an expression, That means a function is a value that represents the function. 
         There are two types of functions 1.domain type(parameter of the function) and 2.range type (a result of the function).
         Three ways to define functions. *)

         (* 1.defining functions 
              Takes one  varable int and insalllling it *)
         
                let double1 (x:int) : int = x * 7;;
         
         (*2.Nameless style (anonymous functions) with usingfun  
              takes a function not given witch type it is *)
         
                (fun n -> n + 5) 2;;            
         
         (* 3.named style with using let *)
         
                let double = double1 8;;
         
         (*  The following function is an example of that, it is called mulint and its arguments are two integers that will be multiplied it will return an integer.
           The arguments are bound inside the function's body using the fun keyword and the right arrow, before the implementation.*)
         
                let mulint : int -> int -> int = fun x y -> x * y;;
                
                mulint 5 10 ;;


(* - Ad-hoc and parametric polymorphism.
         Although the function is statically typed it provides flexibility and reusability in the code as it supports polymorphism.
         This feature allows the programmers to generalise the arguments and return types.
         The advantage is to reuse the function for many different scenarios that match the same signature type pattern, without writing more code. 
         Any implementation of a polymorphic function must follow the generic types defined by using the same types either on the arguments or as the function return result.
         The biggest advantage of this is when defining high order functions that apply the same functionality to different cases. The higher may or may not apply other functions specified in the arguments for certain scenarios.
         In polymorphism we can give any variable type, no need to specify.
         here I told take two variables and returen answer, later I mentioned what to do like addition,subtraction, adding float values and adding strings. *)
        
                let functionPoly: ( 'a -> 'b -> 'c) -> 'a -> 'b -> 'c = fun f x y -> f x y ;;

                functionPoly (fun x y -> x * y ) 3 5;;
                functionPoly (fun x y -> x - y ) 3 5;;
                functionPoly (fun x y -> x +. y ) 3.3 5.6;;
                functionPoly (fun x y -> x ^ y ) "Hello " "Teja";;

       
 (* - List types and tuple types (and their differences).*)
         (* A list is a long sequence of the same type variables. Lists are polymorphic and 'a can be any type, 
         including a function type or list, Lists must contain values of the same type otherways it will rais an error. *)
         (* list of polymorphic functions *)
         
                [fun x -> x; fun x -> x] ;;    (* => ('a -> 'b -> 'b) list = [<fun>] *)
         
         (* list of ints are given and it returns what type are they *)
         
                [15, 25] ;;                     (* => int list = [15; 25] *)
         
         (* list of strings are given and it returns what type are they*)
         
                ["hi"] ;;                       (* => string list = ["hi"] *)
         
        
         (* A tuple is a collection of values of fixed length and type.
         Tuples are immutable, ordered, fix-sized at creation time, heterogeneous (can contain different types of values)
         Giving values to the varables and calling them sepratly *)
                
                let (first,second,third) = (7, 4.3, "Hello");;
         
                first ;;   (* - : int = 7 *)
                second ;;  (* - : flot = 4.3 *)
                third ;;   (* - : string = "Hello" *)


 (* - Equality types.
         We have two kinds of equity comparisons: x = y(shallow equality)and x == y(deep equality)
         a1=a2 checks positions of lista and a1==a2 checke values in side the list *)
        
                let a1 = [1,2,3];;
        
                let a2 = [1,2,3];;
        
                a1 = a2;; (* => false *)
                a1 == a2;; (* => true *)


 (* - ML patterns and pattern-matching.
         we can pattern-match on numbers and strings with match keyword, and it behaves like a case or switch statement 
         Match pattern is a feature that checks if the argument or multiple arguments against values, conditions or deconstructors. When the arguments are evaluated in a certain match pattern its expression runs,
         otherwise the arguments can be evaluated using the wildcard “_” that will run the default expression.
         It is checking the value in the n if it is equal 0 it returns true else false  *)
        
                let is_zero n = match n with
                0 -> true
                | _ -> false ;;
                is_zero 0;;
                is_zero 7;;
         
         (*  This is also same as above one but it checks with string, If it matchs hello returns true else false *)
        
                let is m = match m with
                "hello" -> true
                | _ -> false ;;
                is "hello";;
                is "world";;
         
         (*  This is also same as above one but it checks with lists, If it matchs list returns true else false*)
        
                let hello : int list -> int list = fun xs -> match xs with
                [] -> []
                | [1;2;3] -> [1;2;3]
                | [1;2;3;6;7] -> [1;2;3;0;8];;
                hello [];;
                hello [1;2;3];;
                hello [1;2;3;6;7];;

(* Named and anonymous functions *
         a way which is part of the named function is the partial application, that consists of saving a current function, with more than one argument, and building a new function made of the old function applying a special argument.
         Otherwise, the function might not need to be named or saved, mostly when it is used in one particular case or if it used inside a different normal function or even a high-order function.
         An anonymous function is defined as a lambda expression, using the “fun” keyword to bind the variables from outside the function.
         Named and Anonymous functions have different purposes. Essentially when a function is named it is stored in a variable and it can be called and applied throughout the program.
         The next functions is a normal named functions. The second one is also a named function but resultant from a partially applied named function.*)
    
                let mulint: int ->int -> int = fun x y -> x * y ;;
                mulint 3 9 ;;
                let mulint_by_10 = mulint 10 ;;
                mulint_by_10 56;;
    
        (* anonymous function is declared without being named. These can be declared using the fun keyword, as shown here: *)
        
                (fun x -> x + 1);;      (* int -> int = <fun>*) 

 (* - Recursive functions.
         When a function calls itself is called recursive.
         Recursiveness is essential for functional programming since it is not possible to perform loops or most control flow techniques, 
         since functional programming is part of the declarative paradigm of programming.
         There is a list if this list matchs with empty list then it returns a empty list else it checks head of the list,
         if there is any value then it add one and then it goes on untilend. By this it tells how many valus are in the list *)  
       
                let rec count (xs : int list) : int = 
                match xs with 
                [] -> 0
                | (x::rest) -> 1 + count rest;;  
                count [1;2;3;4;5];; 


 (* - Property based testing (test/EssayTests.ml).
         OCaml has support for unit-based testing. As a result of OCaml being functional programming, It supports property-based testing. 
         property testing is more range than unit testing since the values being tested are assigned randomly by a library as well as the number of test cases.
         UNIT TESTING is a level of software testing where individual units/ components of a software are tested.
         A unit test is a test of one small piece of functionality in a program, such as an individual function.
         The purpose is to validate that each unit of the software performs as designed. A unit is the smallest testable part of any software. It usually has one or a few inputs and usually a single output. 
         We've now learned enough features of OCaml to see how to do unit testing with a library called OUnit.
         OUnit is a unit test framework for OCaml. It allows one to easily create unit-tests for OCaml code.
         



 


 * 
 * Include short code-fragments (as I do when lecturing) to illustrate
 * your observations.
 *
 * Do this in a literate programming style to include executable code
 * to demonstrate the concepts you're writing about, e.g.
 *)

(* The following function adds two numbers together. It has types ... *)

let add (x:int) (y:int) : int = x + y ;;

(* The following function... *)


