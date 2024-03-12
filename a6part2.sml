datatype investment = Stock of string * int * int
                    | Cash of int


fun valueOf(inv : investment) =
    case inv of
        Stock(_, price, shares) => price * shares
        | Cash(amt) => amt


val appleStock = Stock("AAPL", 100, 5)


val ans1 = valueOf(appleStock)





val ans2 = valueOf(myCash)






exception NegativeValue


● if the investment is Cash, prints out “Cash = “ and the amount of money in cash *)
fun printValue(inv: investment) = 
    case inv of 
        Stock(symb, price, shares) => if price * shares < 0 then
                                         raise NegativeValue 
                                      else
                                         (print(symb ^ " = " ^ Int.toString (price * shares)))
      | Cash(amt) => (print("Cash = " ^ Int.toString amt))

val ans3 = printValue(appleStock)

(* 3. Write ML expressions that do the following: *)
(* 1. Defines a function compareValue that takes two investments as arguments and returns
true if the first argument is greater than the second, and false otherwise. *)
fun compareValue(inv1: investment, inv2: investment) =
    valueOf(inv1) > valueOf(inv2)

(* 2. Calls the function compareValue with appleStock and myCash as arguments *)
val ans4 = compareValue(appleStock, myCash)

(* 3. Calls the function compareValue with myCash and appleStock as arguments *)
val ans5 = compareValue(myCash, appleStock)





(* 4. Write ML expressions that do the following: *)
(* 1. Defines a function findMaxValue that takes a list of investments and returns the investment
with the greatest value. *)
fun findMaxValue(investments: investment list) =
    case investments of 
        inv::[] => inv
        | inv::rest => let
                            val max_rest = findMaxValue(rest)
                        in
                            if compareValue(inv, max_rest)
                            then inv
                            else max_rest
                        end

(* 2. Binds the value ("GOOG", 70, 15) to googleStock *)
val googleStock = Stock("GOOG", 70, 15)

(* 3. Binds the value ("FB", 20, 8) to facebookStock *)
val facebookStock = Stock("FB", 20, 8)

(* 4. Binds the value (“IBM”, 30, 10) to ibmStock *)
val ibmStock = Stock("IBM", 30, 10)

(* 4. Creates a list of all five investments (appleStock, ibmStock, googleStock,
facebookStock and myCash) bound to investmentList *)
val investmentList = [myCash, appleStock, googleStock, facebookStock, ibmStock]

(* 5. Calls findMaxValue with investmentList as its argument *)
val ans6 = findMaxValue(investmentList)





(* 5. Write ML expressions that do the following:
1. Defines findMaxValueTwo, which uses compareValue as a nested function *)
fun findMaxValueTwo(investments: investment list) = 
    let fun compareValue2(inv1: investment, inv2: investment) =
        valueOf(inv1) > valueOf(inv2)
    in 
        case investments of
            inv::[] => inv
            | inv::rest => let
                                val max_rest = findMaxValue(rest)
                            in
                                if compareValue(inv, max_rest)
                                then inv
                                else max_rest
                            end
    end

val ans7 = findMaxValueTwo(investmentList)