#!/usr/bin/ruby
=begin
  Program to convert degrees Fahrenheit into degress Celsius.
  Displays the result with 2 decimal places.
  Convert methods needs to be supplied a number
=end

def convert(temp_in_fahrenheit)
  (temp_in_fahrenheit - 32) * 5 / 9
end

print 'Please enter temperature in Fahrenheit: '
STDOUT.flush
temp_to_convert = gets.to_f
puts "#{temp_to_convert} degress Fahrenheit are #{"%.2f" % convert(temp_to_convert)} degrees Celsius."
 


