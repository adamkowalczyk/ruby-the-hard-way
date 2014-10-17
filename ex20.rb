input_file = ARGV[0]

def print_all(f)
  puts f.read
end

def rewind(f)
  f.seek(0)
end

# file.gets reads one line from file. thus moving pointer forward one line
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

# sure enough, file.lineno reports IO line number
def print_a_line_2(f)
 puts "#{f.lineno}, #{f.gets.chomp}"
end

current_file = open(input_file)

puts "First let's open the whole file:\n"

print_all(current_file)

puts "Now let's rewind, kind of like a tape."

rewind(current_file)

puts "Let's print three lines:"

#current_line is clunky, surely we can get the line number directly from the file?
current_line = 1


#print_a_line(current_line, current_file)
print_a_line_2(current_file)
print_a_line_2(current_file)
print_a_line_2(current_file)

current_line += 1
#print_a_line(current_line, current_file)

current_line += 1
#print_a_line(current_line, current_file)

current_file.close