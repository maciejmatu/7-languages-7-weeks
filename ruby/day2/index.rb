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