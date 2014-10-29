
def while_loop(max, increment)
  i = 0
  numbers = []
  while i < max
    puts "At the top i is #{i}"
    numbers << i

    i += increment
    puts "Numbers now:", numbers
    puts "At the bottom i is #{i}"
  end
  puts "The numbers: "
  numbers.each {|num| puts num }
end

while_loop(12,3)