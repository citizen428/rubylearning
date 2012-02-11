#!/usr/bin/ruby
=begin
  Write a Ruby program that, when given an array: collection = [1, 2, 3, 4, 5]
  calculates the sum of its elements.
=end

collection = [1, 2, 3, 4, 5]

puts "Sum: #{collection.inject(:+)}"
