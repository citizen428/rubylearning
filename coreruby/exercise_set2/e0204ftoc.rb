#!/usr/bin/ruby
=begin
  Program to convert degrees Fahrenheit into degress Celsius.
  Displays the result with 2 decimal places.
  Convert methods needs to be supplied a number
=end

def convert(temp_in_fahrenheit)
  (temp_in_fahrenheit - 32) / 1.8
end

print 'Please enter temperature in Fahrenheit: '
STDOUT.flush
input_temp = gets.to_f
puts "%.2fF = %.2fC." % [input_temp, convert(input_temp)]
 


