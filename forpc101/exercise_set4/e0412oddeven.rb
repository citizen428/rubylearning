#!/usr/bin/ruby
=begin
  Write a Ruby program that, when given an array: collection = [12, 23, 456, 
  123, 4579] prints each number, and tells you whether it is odd or even. 
=end

collection = [12, 23, 456, 123, 4579]

collection.each do |x|
  puts "#{x} is #{x % 2 == 0 ? 'even' : 'uneven'}."
end

# The above using explicit method sends
collection.each do |x|
  puts "#{x} is #{x.modulo(2).zero? ? 'even' : 'uneven'}."
end

# Bitwise version #1
collection.each do |x|
  puts "#{x} is #{x >> 1 << 1 == x ? 'even' : 'uneven'}."
end
 
# Bitwise version #2
collection.each do |x|
  puts "#{x} is #{x & 1 == 0 ? 'even' : 'uneven'}."
end