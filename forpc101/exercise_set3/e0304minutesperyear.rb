#!/usr/bin/ruby

def leap_year?(year)
  (( year % 4 == 0 ) && (year % 100 != 0 )) || year % 400 == 0
end

print 'Please enter a year: '
STDOUT.flush
year = gets.to_i
puts "#{year} has #{24 * 60 * (leap_year?(year) ? 366 : 365)} minutes." 
