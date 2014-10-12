# Define variables
# Create sentences with interpolated strings referenced as variables
types_of_people = 10
x ="There are #{types_of_people} types of people."
binary = "binary"
do_not = "don't"
y = "Those who know #{binary} and those who #{do_not}."

# Print joke
puts x
puts y

# Reprint joke with nested interpolated strings
puts "I said: #{x}."
puts "I also said '#{y}'."

# False is a boolean
hilarious = false

# But it becomes a string below, presumably through #to_s
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"

#Print
puts joke_evaluation

# Define two variables with strings
w = "This is the left side of..."
e = "a string with a right side."

# Concatenate the strings. Could also use <<
puts w + e
puts w << e

# Strings surrounded by single quotes do not accept interpolation

puts 'The joke again: #{x} #{y}'

y = 'This is the left side of...'
u = 'a string with a right side.'
# but they do allow concatenation
puts y + u

# mixed concatenation? no problem

p = "This is the left side of..."
o = 'a string with a right side.'

puts p + o