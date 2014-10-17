# as we know the splat (*) converts things to an array
# if this method was given three args, one would end up in arg1, two in arg2 
# ah, need to splat arg2 when destructuring, otherwise we do only get first two args
# this one is like your scripts with ARGV
 def print_two(*args)
  arg1, *arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# ok, that *args is actually pointless, we can just do this
def print_two_again(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# this takes one argument
def print_one(arg1)
  puts "arg1: #{arg1}"
end

# this one takes no arguments
def print_none
  puts "I got nothin'."
end
  
print_two("Zed","Shaw","argument three")
print_two_again("Zed","Shaw")
print_one("First!")
print_none


