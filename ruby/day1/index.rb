# working with strings 
language = "Ruby"
puts "Hello from #{language}"
# everything in ruby returns something
# "" two quote strings are evaluated, '' are literal
puts 'Hello from #{literally}'

=begin
Ruby is a pure Object Oriented language, Everything in it
is an object, even individual numbers 
=end
puts 4.class
puts 4.methods

# ruby can compare many types, e.g. it can do a boolean check
# on a string. Everything, except `nil` and `false`, evaluates
# to true. Even `0` !
puts 'this is true' if 'wow!'; # runs
puts 'zero is true' if 0; # runs
puts 'This is false' unless nil # this runs
puts 'This is won\'t be logged :(' if false # nothing happens


# Logical operators in ruby are nearly identical to other languages
# and (&&)
# or (||)

#single `&` and single `|` will evaluate whole blocks so
puts false && undefined_variable # doesn't throw an error because undef is not evaluated
puts false | undefined_variable # throws an error because whole expression is evaluated

### Duck Typing in Ruby 
# Ruby behaves like a strongly typed language, but because it gives so much control
# the default behaviour can be overriden to defeat type safety
4 + 'four'    # coercion fails, can't coerce string to number 
4.class       # => Fixnum
(4.0).class   # => Float
4 + 4.0       # => coerces to Float

# Ruby checks types on runtime
def add_wrong_types # this will throw error only after it's ran
  4 + 'four'
end

# ruby implements duck-typing that allows to map array of numbers and number-strings,
# and convert them all to Float using `.to_f` or to Fixnum using `.to_i`