hello = 'Hello, world'
puts hello

puts "Hello, Ruby,".index('Ruby')

10.times do puts "Maciej" end

for value in 1...11 do
  puts "This is a sentence number " << value
end

begin
  require "./index.rb"
rescue StandardError=>e
  puts "This ruby script failed: #{e}"
else 
  puts "Executed succesfully"
end

puts "________________"
puts "Guess a number from 0-100: "
num = rand(100);
guess = gets.chomp.to_i
puts "guessed #{guess}, correct: #{num}"

if (num === guess)
  puts "WOW! You guessed it!"
elsif ((num - guess).abs < 20) 
  puts "Close one!"
else 
  puts "Not even close"
end