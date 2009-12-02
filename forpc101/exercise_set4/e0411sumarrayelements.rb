#!/usr/bin/ruby
=begin
  Write a Ruby program that, when given an array: collection = [1, 2, 3, 4, 5] 
  calculates the sum of its elements. 
=end

collection = [1, 2, 3, 4, 5]

sum = collection.inject(0) { |sum, x| sum += x}
puts "Sum using inject: #{sum}"

# or without inject
sum = 0
collection.each { |x| sum += x }
puts "Sum using each: #{sum}"

=begin
  # Ruby 1.9 version of inject
  
  sum = collection.inject(0, :+)
  puts "Sum using inject and Symbol#to_proc: #{sum}"
=end
