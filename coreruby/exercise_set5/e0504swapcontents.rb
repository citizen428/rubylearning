#!/usr/bin/ruby
=begin
  Write a Ruby program to do the following. Take two text files say A and B. 
  The program should swap the contents of A and B. That is after the program is 
  executed, A should contain B's contents and B should contains A's contents. 
=end

unless ARGV.length == 2 
  puts "Swaps the contents of 2 files.\n\nUsage: ruby #{$0} file1 file2"
  exit 1
end

ARGV.each do |file|
  unless File.exists?(file)
    puts  "Error: Can't find #{file}"
    exit 2
  end
end

file1, file2 = ARGV

swap = File.readlines(file2)

File.open(file2, 'w') do |f|
  f.puts(File.readlines(file1))
  f.close
end

File.open(file1, 'w') do |f|
  f.puts swap
  f.close
end
