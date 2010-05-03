#!/usr/bin/ruby
=begin
  Write a method leap_year?. It should accept a year value from the user, 
  check whether it's a leap year, and then return true or false. 
  
  With the help of this method calculate and display the number of minutes 
  in a leap year or non-leap year.
  
  Note: a century year is a leap year only if it is divisible by 4.
=end

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || year % 400 == 0
end

print 'Please enter a year: '
STDOUT.flush
year = gets.to_i
puts "#{year} has #{24 * 60 * (leap_year?(year) ? 366 : 365)} minutes." 
