#!/usr/bin/env ruby

def leap_year?(year)
  year % 4 == 0  && year % 100 != 0 || year % 400 == 0
end

print 'Please enter the year to be checked: '
STDOUT.flush
input_year = gets.to_i

puts "#{input_year}:#{' not' unless leap_year?(input_year)} a leap year"
