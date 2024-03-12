fun map (f,xs) =
    case xs of
        [] => []
        | first::rest => (f first)::(map(f, rest))
fun filter (f,xs) =
    case xs of
        [] => []
        | first::rest => if f first
            then first::(filter (f, rest))
            else filter (f, rest)

(*1*)

type date=(int*int*int)
datatype investment=Stock of string *int *int*(date) | Cash of int *(date)

fun valueOf i=
    case i of   
        Stock(_,p,s,_)=> p*s
        | Cash(a,_)=> a
val appleStock = Stock("AAPL", 100, 5,(2015,5,10));
val myCash = Cash(200,(2014,3,7));
val googleStock = Stock("GOOG", 70, 15,(2014,8,3));
val facebookStock = Stock("FB", 20, 8,(2015,2,9));
val ibmStock = Stock("IBM", 30, 10,(2010,6,20));
val investmentList = [myCash, appleStock, googleStock, facebookStock, ibmStock];
val ans=map(valueOf,investmentList);

(*2*)
fun olderThan((y1,m1,d1),(y2,m2,d2))=
    if y1=y2
    then if m1=m2
        then d1<d2
        else m1<m2
    else y1<y2

fun olderThan01_01_15 i =
    let 
        val d1=(2015,1,1)
    in 
        case i of
            Stock(_,_,_,d2)=>olderThan(d2,d1)
            | Cash(_,d2)=> olderThan(d2,d1)
    end
val ans2=filter(olderThan01_01_15,investmentList);

(*3*)


val ans3=filter((fn i => valueOf i>250),investmentList);

(*4*)
val ans4=map(valueOf,filter(olderThan01_01_15,investmentList));





