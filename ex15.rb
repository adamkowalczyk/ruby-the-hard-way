# take cmd line arg for filename to open
filename = ARGV.first
# open the file as an object
txt  = open(filename)

puts "Here's your file #{filename}:"
# read from file using .read
print txt.read

print "Type the filename again: "
# use gets for filename instead
file_again = $stdin.gets.chomp

txt_again = open(file_again)

print txt_again.read

# close the open files
txt.close
txt_again.close