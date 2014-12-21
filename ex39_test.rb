require './dict.rb'

# create a mapping of states to abbreviation
states = Dict.new
Dict.set(states, 'Oregon', 'OR')
Dict.set(states, 'Florida', 'FL')
Dict.set(states, 'California', 'CA')
Dict.set(states, 'New York', 'NY')
Dict.set(states, 'Michigan', 'MI')

# create a basic set of states and some cities in them
cities = Dict.new
Dict.set(cities, 'CA', 'San Francisco')
Dict.set(cities, 'MI', 'Detroit')
Dict.set(cities, 'FL', 'Jacksonville')

# add some more cities
Dict.set(cities, 'NY', 'New York')
Dict.set(cities, 'OR', 'Portland')

# puts some cities
puts '_' * 10
puts "NY state has: #{Dict.get(cities, 'NY')}"
puts "OR state has: #{Dict.get(cities, 'OR')}"

# puts some states
puts '_' * 10
puts "Michigan's abbreviation is #{Dict.get(states, 'Michigan')}"
puts "Florida's abbreviation is #{Dict.get(states, 'Florida')}"

# do it by using the state then cities dict
puts '_' * 10
puts "Michigan has: #{Dict.get(cities, Dict.get(states, 'Michigan'))}"
puts "Florida has: #{Dict.get(cities, Dict.get(states, 'Florida'))}"

# puts every state abbreviation
puts '_' * 10
Dict.list(states)

# puts every city in state
puts '_' * 10
Dict.list(cities)

#by default Ruby says "nil" when something insn't in there
puts '_' * 10
state = Dict.get(states, 'Texas')

if !state
  puts "Sorry, no Texas."
end

# default values using ||= with the nil result
city = Dict.get(cities, 'TX', 'Does Not Exist')
puts "The city for the state 'TX' is #{city}"