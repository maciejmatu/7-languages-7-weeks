# true, false, nil and singletons
(4 < 5) println # => true
4 < 5 println # => "5", because the compiler thinks we want to send message println to number 5
true and false # => false
true and true # => true
true or true # => true
true or false # => true
(4 < 5 and 5 > 7) println # => false
true and 0 # => true (0 is true, same as in Ruby)

true clone # => true
false clone # => false
nil clone # => nil
# true, false and nil are singletons! cloning them returns the singleton value

# We can also create singletons if we want to.
Drink := Object clone
Drink clone := Drink # => we redefine clone slot, to return the current object

americanBeer := Drink clone
water := Drink clone 
(americanBeer == water) println # => true, ...well well well...

