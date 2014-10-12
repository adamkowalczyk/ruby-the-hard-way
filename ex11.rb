# gets means get string. chomp is a string method removes carriage return chars from end of string (by default)
print "How old are you? "
age = gets.chomp
print "How tall are you? "
height = gets.chomp
print "How much do you weigh? "
weight = gets.chomp

puts "So, you're #{age} old, #{height} tall and #{weight} heavy."

# calculator for 'extra credit'
# only works if people enter actual numbers...
puts "Enter a number"
num_1 = gets.chomp.to_i
puts "Choose from + - / *"
operator = gets.chomp
puts "Enter a second number"
num_2 = gets.chomp.to_i
result = 0

if operator == "+"
 result = num_1 + num_2
elsif operator == "-"
  result = num_1 - num_2
elsif operator == "/"
  result = num_1 / num_2
elsif operator == "*"
  result = num_1 * num_2
else
  result = "Calculation failed"
end

puts "result = #{result}"       