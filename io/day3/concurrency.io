// COROUTINES
// coroutine provides a way to voluntarily suspend and resume execution of a process
// one could think of it as a function with multiple entry and exit points

// to fire a message asynchronously use @ or @@ before a message
// @ returns a 'future'
// @@ returns nil and starts a message in its own thread
bob := Object clone
bob talk := method(
  "hello" println 
  yield
  "Are you hungry" println
  yield
)

john := Object clone
john respond := method(
  yield
  "Hello to you too" println
  yield
  "I'm starving!" println
)

bob @@talk; john @@respond



// ACTORS 
// Actors change their own state and access other actors through closely controlled queues.
// Threads on the other hand, are prone to race-conditions
// sending an asynchronous message to any object makes it an actor.
slower := Object clone
faster := Object clone
slower start := method(str, wait(2); writeln("slower ", str))
faster start := method(str, wait(1); writeln("faster ", str))

slower start("SYNC")
faster start("SYNC") 
// calling both methods synchronously results in "slower" and then "faster"

slower @@start("ASYNC") // returns nil
faster @@start("ASYNC")
// results in "faster" and then "slower"

// FUTURES
// future is a result object that is immediately returned from an asynchronous message call
// future becomes the result once it's available
// asyncMessage := method(wait(2); return "Completed")
futureResult := futureSend(method(wait(5) "Completed"))
writeln("This will be called immediately")
writeln("Future result: ", futureResult)
writeln("This will be called after resolving")

Coroutine currentCoroutine pause