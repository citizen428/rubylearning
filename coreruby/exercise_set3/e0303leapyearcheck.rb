#!/usr/bin/ruby
=begin
  Ask user to input a year and tell him if it's a leap year.
=end

def leap_year?(year)
  (( year % 4 == 0 ) && (year % 100 != 0 )) || year % 400 == 0 
end

print 'Please enter the year to be checked: '
STDOUT.flush
year_to_check = gets.to_i

puts "%s:#{' not' unless leap_year?(year_to_check)} a leap year" % year_to_check

