first, second, third = ARGV 

puts "Your first variable is: #{first}"
puts "Your second variable is #{second}"
puts "Your third variable is #{third}"

p ARGV

print "Input please, anything will do: "
var = $stdin.gets.chomp
puts var