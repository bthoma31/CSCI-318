fun is_older(d1:int*int*int ,d2:int*int*int)=
    if #1 d1 < #1 d2
    then true
    else if #1 d1 = #1 d2 andalso #2 d1 < #2 d2
    then true
    else if #1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3 d1 < #3 d2
    then true
    else false

val test1 = is_older((1,2,3),(2,3,4));

fun number_in_month(dates, month)=
    case dates of 
        [] => 0
        | (y,m,d) :: rest => if m=month 
                             then 1+ number_in_month(rest,month)
                             else number_in_month(rest,month)

val test2 = number_in_month([(2012,2,28),(2013,12,1)],2);

fun number_in_months(dates, months)=
    case months of
        [] => 0
        | month ::rest => number_in_month(dates,month)+number_in_months(dates,rest)

val test3=number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,
3,4]);
                                
fun get_nth(xs:string list, n :int)=
    case n of
        1=>(hd xs)
        | _ => get_nth(tl xs, n-1)

val test4 = get_nth(["hi", "there", "how", "are", "you"], 2);

fun date_to_string(date: int*int*int)=
    let
        val monthList=["January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                       "November", "December"]
        val month=get_nth(monthList,#2 date)
    in 
        month ^ " " ^ Int.toString(#3 date) ^ " , " ^ Int.toString(#1 date)
    end

val test5 = date_to_string((2013, 6, 1));

fun oldest(dates)=
    case dates of   
        []=> NONE
        | date::[]=> SOME date

        | date ::rest => let            
                            val oldest_rest= oldest(rest)
                         in 
                            if is_older(date,valOf oldest_rest)
                            then SOME date
                            else oldest_rest
                        end

val test6 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]);
val test7 = oldest([]);