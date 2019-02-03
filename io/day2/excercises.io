 
// find n fibonacci number
fib := method(n, (
  if (n == 0 or n == 1, return n)

  a := 0; b := 1

  (n - 1) repeat(
    sum := a + b
    a = b; b = sum
  )

  b
))

recurseFib := method(n,
  if(n == 0 or n == 1, return n)
  recurseFib(n - 1) + recurseFib(n - 2)
)

fib(1) println
fib(2) println
fib(4) println
fib(8) println
recurseFib(1) println
recurseFib(2) println
recurseFib(4) println
recurseFib(8) println