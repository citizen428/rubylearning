#!/usr/bin/ruby
=begin
  Write a one-line Ruby script that displays on the screen all 
  the files in the current folder as well as everything in all 
  its sub folders, in sorted order. Make use of Dir.glob method: 
  http://www.ruby-doc.org/core/classes/Dir.html#M002347 
  as follows: Dir.glob('**/*') 
=end

puts Dir.glob('**/*').sort

