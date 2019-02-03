### Conditionals and Loops 

# loop("infinite..." println) # This is an infinite loop
i := 1
while (i <= 11, i println; i = i + 1); "This one goes up to 11" println
for(i, 1, 11, i println); "This one also goes up to 11" println
for(i, 1, 11, 2, i println); "This one also goes up to 11 but with two's" println

if (true, "It's true", "It's false") println
if (false) then ("It's true" println) else ("It's false" println)

# adding custom operators! The number 11 is precendence in the OperatorTable
# it means that this custom operator will be on the same level as 'or ||'
OperatorTable addOperator("xor", 11)
# next we must implement this method on true & false
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))

true xor true println
true xor false println

# Messages!
postOffice := Object clone
postOffice packageSender := method(call sender)

mailer := Object clone
mailer deliver := method(postOffice packageSender)
mailer deliver