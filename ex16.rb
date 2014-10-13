# take a filename as a cmd line arg. use an array index rather than .first
filename = ARGV[0]

# create an escape sequence for the user, script wont continue unless gets return successfully
puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

$stdin.gets

# Open file in write mode
puts "Opening file..."
target = open(filename, 'w')

# delete contents by truncating file to arg max size bytes. in this case zero
# But, write mode automatically truncates...

# puts "Truncating the file. Goodbye!"
# target.truncate(0)

puts "Now I'm going to ask you for three lines."

# Take three lines of user input, store in variables
print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

# Write lines to file, add line breaks after each one with \n
# target.write(line1)
# target.write("\n")
# target.write(line2)
# target.write("\n")
# target.write(line3)
# target.write("\n")

target.write("#{line1}\n#{line2}\n#{line3}\n")

# Close that file
puts "And finally, we close it."
target.close