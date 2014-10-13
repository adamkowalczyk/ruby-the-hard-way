# ask for user input, convert string to integer
# changed to float, to_f
print "Give me a number: "
number  = gets.chomp.to_f

bigger = number * 100
puts "A bigger number is #{bigger}."

# separate gets and to_i, also redefine var 'number'
print "Give me another number: "
another = gets.chomp
number = another.to_f

smaller = number / 100
puts "A smaller number is #{smaller}."  

# write a change script

print "Can I have some money please? Go on, enter how much you want to give me: "
money = gets.chomp.to_f
puts "Here is your change: #{money / 10}"