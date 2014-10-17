# david wicke's version. looking into it, I discovered that .write and .read close the file automatically. 
# so, my version passing a block to close the file was redundant

File.open(ARGV[1], 'w').write(File.open(ARGV[0]).read)

# interestingly, can't call .closed? to check state, as write and read return a string
# p ARGV[0].closed?
# p ARGV[1].closed?