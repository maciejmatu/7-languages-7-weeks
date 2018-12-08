# Defining functions in ruby is quite simple 
def square(num = 0)
  num * num
end

puts square # uses default val, returns 0
puts square(4) # returns 16

# Ruby primary ordered collections are Arrays
letters = ['a', 'b', 'c'] # creates an array
letters[1] # refers to letter 'b'
letters[-1] # refers to last array item, 'c'. This is a Syntactic sugar method 
letters[0..1] # returns a subarray with two first items of an array
(0..1).class # => Range

# [] and []= are just syntactic sugar to allow access to an array

# Ruby other primary collection is a Hash
numbers = { 1 => 'one', 2 => 'two' }
numbers[1] # => 'one'
stuff = { :array => [1, 2, 3], :string => 'Hello' };
puts stuff[:string] # => Hello
# Above we used a symbol. Two strings can be a different physical object
# but two symbols can be the same
puts 'string'.object_id == 'string'.object_id # => false
puts :symbol.object_id == :symbol.object_id # => true

# Code Blocks & yield
3.times { puts 'hey there' } # {} is a codeblock. {} is used for single-liners
3.times do |num|  # do/end is a code block used for multi-liners
  puts num.to_s << 'wooow'
end

['a', 'b'].each { |letter| puts "#{letter} is in alphabet"} # code block can have a parameter

# Below we extend ruby Fixnum by a custom method, that uses a codeblock. 
# yield is put where the codeblock is evaluated 
class Fixnum
  def custom_times 
    i = self
    while i > 0
      i = i - 1
      yield
    end
  end
end

3.custom_times { puts 'wow!'}

def call_block(&block)
  block.call
end

call_block { puts 'Hello from block' }

# Classes In Ruby
# A class can inherit from only one parent called a `superclass`
4.class # => Fixnum
4.class.superclass # => Integer
4.class.superclass.superclass # => Numeric
4.class.superclass.superclass.superclass # => Object
4.class.superclass.superclass.superclass.superclass # => nill

# Mixins in ruby
# ruby implements mixins by using a `module`. The naming differs between
# languages, e.g. Java uses interfaces for that
module ToFile 
  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(File.dirname(__FILE__) << '/' << filename, 'w') do |f|
      f.write(to_s) # module uses a class method that has not been defined yet
    end
  end
end

class Person
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

Person.new('maciej').to_f

# <=> is called a spaceship operator 
a = 1
b = 3
a <=> b # returns -1 if b is greater, 1 if a is greater and 0 therwise
1 <=> 2 # returns -1
3 <=> 2 # returns 1
2 <=> 2 # returns 0

# Ruby enumerable and comparable mixins
arr = [5, 3, 4, 1]
a.sort # => [1, 3, 4, 5]
a.any? { |i| > 6 } # false -- no number is higher than index
a.all? { |i| > 0 } # true -- all numbers are higher than zero
a.collect { |i| i * 2 } # [10, 6, 8, 2] -- same as map
a.select { |i| i % 2 == 0 } # [4] -- works like a filter
a.max # 5
a.member?(2) # false
a.inject(0) {|sum, i| sum + i} # 13 -- works like reduce in js


# In ruby performance is secondary. Ruby is about the performance of the programmer
