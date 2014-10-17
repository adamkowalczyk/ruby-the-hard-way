# lets try and do a better version of ex 17. credit to various stackoverflow contributors 

# take command line arguments as per original exercise

from_file, to_file = ARGV

# use nested File.open blocks to process files.
# using a block automatically closes the file
# N.B. in_f*.read* omitting the .read puts the file id in out file, not the file contents! 

File.open(from_file, "r") do |in_f|
  File.open(to_file, "w") do |out_f|
    out_f << in_f.read
  end
end     
  