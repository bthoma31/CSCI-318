fun silly2()=
    let val x=1
    in  
        (let val x=2 in x+1 end)+(let val y=x+2 in y+1 end)
    end
val ans=silly2();

fun mystery(x:int option)=
    if isSome x
    then let val y=(valOf x) in y*y end
    else 0

val ans2=mystery(NONE);

fun silly1(z:int)=
    let val x=z>0 then z else 4
    val y=x+z+3
    in
    if x>y then x*2 else y*y
    end

val ans3=silly1(-5);


