fun count_list(xs : int list) = 
    if null xs
    then 0
    else 1 + count_list(tl xs);

count_list([1, 2, 3, 4, 5]);


fun sum_list (xs : int list) =
    if(null xs)
    then 0
    else (hd xs) + sum_list(tl xs);

sum_list([1, 2, 3, 4, 5]);

fun countdown (n : int)=
    if(n = 1)
    then [1]
    else n :: countdown(n-1);

countdown(5);

fun countup (s : int , f: int)=
if(s=f)
then[s]
else s :: countup(s+1,f);

countup(1,10);

fun find_last (xs : int list)=
    if null (tl xs)
    then hd xs
    else find_last(tl xs);

find_last([1,2,3]);