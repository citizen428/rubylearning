#!/usr/bin/env ruby

=begin
  Write a method called month_days, that determines the number of days in a month. Usage:

  days = month_days(5) # 31 (May)
  days = month_days(2, 2000) # 29 (February 2000)

  Remember, you could use the Date class here. Read the online documentation for the Date 
  class. You must account for leap years in this exercise.
=end

require 'Date'

def month_days(month, year=Time.now.year)
  Date.new(year,month,-1).day
end

# tests
puts month_days(5)
puts month_days(2, 2000)
puts month_days(2, 1700)
puts month_days(2, 2001)
puts month_days(9)
