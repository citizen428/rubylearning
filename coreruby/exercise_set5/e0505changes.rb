#!/usr/bin/ruby
=begin
  Write a one-line Ruby script that displays on the screen all 
  the files in the current folder as well as everything in all 
  its sub folders, in sorted order. Make use of Dir.glob method: 
  http://www.ruby-doc.org/core/classes/Dir.html#M002347 
  as follows: Dir.glob('**/*') 

  Now, write another Ruby script that displays on the screen all 
  the files that have been added in this folder since the time 
  the old-inventory.txt was created.
=end

unless ARGV.length == 2
  puts "Usage: ruby #{$0} old-list new-list"
  exit 1
end

ARGV.each do |file|
  unless File.exist?(file)
    puts "Can't find #{file}!"
    exit 2
  end
end

old_files = File.readlines(ARGV[0]) 
new_files = File.readlines(ARGV[1])

(old_files - new_files).each { |rem| puts "\t- #{rem}" }
(new_files - old_files).each { |add| puts "\t+ #{add}" }
