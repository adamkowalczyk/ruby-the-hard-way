# Exercise 4 of LRTHW

cars = 100
space_in_car = 4.0
drivers = 30
passengers = 90
# Create easily comprehensible derived variable.
cars_not_driven = cars - drivers
# Redefine number of drivers in terms of available cars
cars_driven = drivers
# Further derived values 
carpool_capacity = cars_driven * space_in_car
average_passengers_per_car = passengers / cars_driven

# Print a series of helpful carpool related messages
puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."