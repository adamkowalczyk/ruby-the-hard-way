puts "Mary had a little lamb."
puts "It's fleece was white as #{'snow'}."
puts "And everywhere that Mary went."
puts "." * 10 # what'd that do? print 10 full stops I should think

end1 = "C"
end2 = "h"
end3 = "e"
end4 = "e"
end5 = "s"
end6 = "e"
end7 = "B"
end8 = "u"
end9 = "r"
end10 = "g"
end11 = "e"
end12 = "r"

# watch that print vs puts on this line what's it do?
print end1 + end2 + end3 + end4 + end5 + end6
puts end7 + end8 + end9 + end10 + end11 + end12

# well, print will put it on one line with now spaces
# puts will put each letter on a separate line: to_s /n
# for good measure #p inspects

# my mistake, of course puts doesn't add a new line, its all concatenated
# contrast separate statements 

print end1
print end2
print end3
print end4
print end5
print end6