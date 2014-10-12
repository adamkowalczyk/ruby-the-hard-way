# \t creates a tab
tabby_cat = "\tI'm tabbed in."
# \n creates a new line
persian_cat = "I'm split\non a line."
# \\ creates an escaped backslash
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

puts tabby_cat
puts persian_cat
puts backslash_cat
puts fat_cat

# \a bell makes a beep or flashes the screen in terminal, cool ticker tape anachronism.
puts "\a testin\ag 'bell'"
puts "\b testin\bg 'backspace'"
puts "\f testin\fg 'formfeed'"
puts "\r testin\rg 'carriage return'"
puts "\v testin\vg 'vertical tab'"

# yes, only a single set of single or double quotes is required to maintain line breaks
# was triple quoting required in an older version of ruby, or is it a python carry over?
puts "
does the
single quote
preserve
multiple lines
"