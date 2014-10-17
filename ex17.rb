# decided to write a better version from scratch rather than tinker with this. 
# see ex17_alt.rb

from_file, to_file = ARGV

puts "Copying from #{from_file} to #{to_file}"

# we could do these on one line, how?
#in_data = ""
#File.open(from_file) { |f| in_data = f.read }

in_file = open(from_file)
in_data = in_file.read

puts "The input file is #{in_data.length} bytes long"

puts "Does the output file exist? #{File.exist?(to_file)}"
puts "Ready, hit RETURN to continue, CTRL-C to abort."
$stdin.gets

out_file = open(to_file, 'w' )
out_file.write(in_data)

puts "Alright, all done."

in_file.close
out_file.close
