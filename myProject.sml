fun hello_world(n:int) =
    if n = 0 
    then ()
    else (
        print "hello world\n"; 
        hello_world(n-1)
        );

hello_world(5);

fun fibonacci (x:int) =
    if (x=0 orelse x=1) then (
        print("x = " ^ Int.toString x ^ "\n");
        x
        )
    else
    let val x1 = fibonacci(x-1)
        val x2 = fibonacci(x-2)
    in
        print ("x = " ^ Int.toString x ^ ", f(x-1) = " ^ Int.toString x1 ^ ", f(x-2) = " ^ Int.toString x2 ^ "\n");
        x1 + x2
    end;

fibonacci(5);