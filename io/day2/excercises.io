 
// find n fibonacci number
fib := method(n, (
  if (n == 1, return 1)

  a := 0; b := 1

  (n - 1) repeat(
    sum := a + b
    a = b; b = sum
  )

  b
))

fib(1) println
fib(2) println
fib(3) println
fib(4) println
fib(5) println
fib(8) println