#!/usr/bin/ruby
=begin
   Breaks a multiline string up into individual lines
   and outputs them including line numbers.
=end

s="Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

s.split.each_with_index do |line, line_count|
  puts "Line #{line_count + 1}: #{line}"
end

=begin
  Ruby 1.9:
  s.each_line.with_index { |l, i| puts "Line #{i+1}: #{l}"}
=end

















