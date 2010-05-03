#!/usr/bin/ruby
=begin
   Breaks a multiline string up into individual lines
   and outputs them including line numbers.

   Needs Ruby 1.9
=end

s="Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

s.each_line.with_index { |line, i| puts "Line #{i+1}: #{line}" }















