# Ruby makes metaprogramming easier.
# metaprogramming is writing programs that write programs

# in ruby its easy to modify existing classes
class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

["", "person", nil].each { |el| p el unless el.blank? } # puts only person

# We could break ruby if we wanted to, LOL, Just uncomment the class below
# class Class
#   def new
#     false
#   end
# end

puts String.new "Hello1" # Yep, I broke it

# We can extend Numeric class because why not
class Numeric
  def donuts
    puts "gonna be fat if you eat #{self} donuts"
    self
  end
end

10.donuts

# There is a method called method_missing that's used for debugging.
# We can utilize it to write some functionality
class Roman
  def self.method_missing name, *args
    roman = name.to_s
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")

    (roman.count("I") +
     roman.count("V") * 5 +
     roman.count("X") * 10 +
     roman.count("L") * 50 +
     roman.count("C") * 100)
  end
end

puts Roman.X
puts Roman.XII
puts Roman.LCII

# DSL (Domain Specific Language) allows to tailor the language to a specific domain e.g.
# mapping ActiveRecord class to Database object, or writing a DSL for Class <=> CSV communication
