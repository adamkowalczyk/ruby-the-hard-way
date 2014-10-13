# ARGV is an array so...
#food = ARGV[1]
#user_name = ARGV.first
# works but its better to write
user_name,food = ARGV
prompt = '>'

puts "Hi #{user_name}."
puts "I'd like to ask you a few questions."
puts "Do you like me #{user_name}?", prompt
likes = $stdin.gets.chomp

puts "Where do you live #{user_name}?", prompt
lives = $stdin.gets.chomp

puts "What kind of computer do you have?", prompt
computer = $stdin.gets.chomp

# using single rather than triple double-quotes here
puts "
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is.
And you have a #{computer}. Nice.
Now I'm going to go and eat some #{food}.
"