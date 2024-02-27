fun printValue (stock : string * int * int) =
    print ( (#1 stock) ^ " : " ^ Int.toString((#2 stock)* (#3 stock)) ^ "\n")
val appleStock = ("APPL",100,5);
val _ = printValue(appleStock);

fun compareValue (s1 : string *int * int, s2: string * int *int)=
    if ((#2 s1) * (#3 s1) > (#2 s2)* (#3 s2))
    then ((#2 s1) * (#3 s1))
    else ((#2 s2)* (#3 s2))
val ibmStock =("IBM",30,10);
val appleStock = ("APPL",100,5);
val solutions = compareValue(appleStock,ibmStock);

fun stockValue (stock : string * int * int)=
    (#2 stock)* (#3 stock)

fun findMaxValue (stocks : (string *int * int) list )=
    if (tl stocks)= []
    then (hd stocks)
    else let
            val tlMax=findMaxValue(tl stocks)
            val tlMaxValue = stockValue(tlMax)
        in 
            if stockValue(hd stocks) > tlMaxValue
            then(hd stocks)
            else tlMax
        end

val googleStock = ("GOOG", 70, 15);
val facebookStock= ("FB", 20, 8);

val stockList= [appleStock,googleStock,facebookStock,ibmStock];
val solutions3= findMaxValue(stockList);

fun findMaxMalueTwo (stocks : (string *int *int ) list) =
    let fun compareValue2 (s1 : string *int *int, s2 : string *int *int)=
            ((#2 s1) * (#3 s1) > (#2 s2)* (#3 s2))
    in  
        if(tl stocks) =[]
        then (hd stocks)
        else let    
                val tlMax=findMaxValue(tl stocks)
            in 
                if compareValue2((hd stocks), tlMax)
                then (hd stocks)
                else tlMax
            end
    end

val ans4= findMaxMalueTwo(stockList);
    