### Q1: Is io strongly or weakly typed?
e := try (
  (1 + 1) println # => 2
  (1 + "one") println # => error
  # It seems that Io is strongly type since it doesn't allow for work
  # with different types, and it doesn't coerce values automatically
  (false + "one") # => errors "false does not respond to +".
  # Boolean values cannot perform addition because the do not support the message "+"
  (2 + true) println # => must be a number error 
)
e catch (
  "Seems like Io is strongly typed!" println
)

### Q2: Is 0 true or false? Is nil true or false? What about empty strings?
"" and true # => true
nil and true # => false
nil and false # => false
nil == true or nil == false # => nil is neither, true nor false
nil or true # => true 
nil or false # => false. 
# It seems that nil is treated as false
nil isTrue println # => returns false. hm... Seems like it's false.
0 isTrue println # => returns true
"" isTrue # => returns true 

### Q3: How to check what slots does a prototype support?
"" proto slotNames

### Q4: What is the difference between `=`, `:=` and `::=` ?
a ::= 1 # Creates slot, creates setter, assigns value. Compiles to =>  newSlot("a", 1)
a := 1 # Creates slot, assigns value. Compiles to => setSlot("a", 1)
a = 1 # Assigns value to slot if it exists, otherwise raises exception. Compiles to => updateSlot("a", 1)


# run another io file 
"
  Running index.io script
  ...
" println
"Running index.io script..." println 
try (
  doFile("index.io")
)
"
  Finnished running index.io script.
" println 

"Invoke method by name" println
saySomething := method("Well hello" println)
invokeByName := method(name, self getSlot(name) call)
invokeByName("saySomething")
