#!/usr/bin/ruby
=begin
  1. Load in a file containing the text or document you want to analyze. 
  2. As you load the file line by line, keep a count of how many lines there are 
  (one of your statistics taken care of). 
  3. Put the text into a string and measure its length to get your character count. 
=end
file_to_analyze='./text.txt'

scan_string = ''
line_count = char_count = 0

begin
  file = File.new(file_to_analyze, "r")
  while (line = file.gets)
    line_count += 1
    scan_string << line 
  end
  file.close
rescue => err
  puts "Exception: #{err}"
  err
end

char_count = scan_string.length

puts "#{file_to_analyze} has #{line_count} lines and #{char_count} characters."

