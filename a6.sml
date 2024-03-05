datatype investment= Stock of string *int *int | Cash of int

fun valueOf(inv: investment)=
    case inv of 
        Stock(_,price,shares) => price*shares | Cash(amt)=>amt

val appleStock= Stock("APPL",100,5);
val ans1=valueOf(appleStock);

val myCash=Cash(200);
val ans2=valueOf(myCash);

exception NegativeValue

fun printValue(inv: investment)=
    case inv of 
        Stock(symb,price,shares)=> if price*shares <0
                                    then raise NegativeValue
                                    else print(Int.toString(price*shares)) | Cash(amt)=> print ("Cash = " ^ Int.toString(amt))
                            

val ans3=printValue(appleStock);

fun valueOf(inv:investment)=
    case inv of 
        Stock(_,p,s)=> p*s | Cash(a)=> a

fun compareValue(inv1:investment,inv2:investment)=
    valueOf(inv1)>valueOf(inv)
    
fun findMaxValue(investments)=
    case investments of 
        inv ::[] => inv | inv ::rest => let 
                                        val max_rest=findMaxValue(rest)
                                      in
                                        if compareValue(inv,max_rest)
                                        then inv
                                        else max_rest
                                      end
val googleStock=Stock("GOO",70,15);
val face=Stock("fb",20,8);
val ibm=Stock("iBM",30,10);

val investmentList=[myCash,appleStock,googleStock,face,ibm];
val ans5=findMaxValue(investmentList);

