# Here's some new strange stuff, remember type it exactly.

days = "Mon Tue Wed Thu Fri Sat Sun"
# \n creates a  new line
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

puts "Here are the days: #{days}"
puts "Here are the months: #{months}"

# Tripe quotes preserve line breaks, hard to find clear documentation of the feature
puts """
There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
"""

# test triple single quotes

puts '''
There\'s something going on here.
With the three double-quotes.
We\'ll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
'''