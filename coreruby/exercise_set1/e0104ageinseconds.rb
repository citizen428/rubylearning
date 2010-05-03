#!/usr/bin/ruby
=begin
  Displays the age (in years) of a person who is 979000000 seconds old.
  There are 31536000 seconds in a non leap year
=end
AGE_IN_SECONDS = 979_000_000
SECONDS_PER_YEAR = 60.0 * 60 * 24 * 365
age_in_years = AGE_IN_SECONDS / SECONDS_PER_YEAR

puts "979000000 seconds are %.2f years." % age_in_years
