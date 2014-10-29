
# def while_loop(max, increment)
#   i = 0
#   numbers = []
#   while i < max
#     puts "At the top i is #{i}"
#     numbers << i

#     i += increment
#     puts "Numbers now:", numbers
#     puts "At the bottom i is #{i}"
#   end
#   puts "The numbers: "
#   numbers.each {|num| puts num }
# end

# while_loop(12,3)

def for_loop(max, increment)
  numbers = []
  (1..max).each do |n|
    puts "Currently, n is #{n}"
    numbers << n
    print "Numbers are: ", numbers
    puts "\nNext number is #{n + 1}"
  end
  puts "The numbers: "
  numbers.each {|num| puts num }
end

for_loop(6,1)