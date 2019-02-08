 
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

"" println 
Date secondsToRun(fib(20)) println // 0.000054
fib(20) println // 6765

"" println
Date secondsToRun(recurseFib(20)) println // 0.16394
recurseFib(20) println // 6765

// Hmm either I made a mistake or recursion for fib sequence sucks lol

// add up all items from 2d list
myList := list(1, 2, 3, list(4, 5), list(6, 7), 8)

myList flatten sum println