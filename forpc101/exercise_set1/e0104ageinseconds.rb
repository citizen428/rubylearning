#!/usr/bin/ruby
=begin
  Displays the age (in years) of a person who is 979000000 seconds old.
  There are 31536000 seconds in a non leap year
=end
AgeInSeconds = 979000000
SecondsPerYear = 60 * 60 * 24 * 365
age_in_years = AgeInSeconds / SecondsPerYear.to_f

puts "979000000 seconds are #{"%.2f" % age_in_years} years."
