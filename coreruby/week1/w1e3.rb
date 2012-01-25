#!/usr/bin/env ruby

AGE_IN_SECONDS = 979_000_000
SECONDS_PER_YEAR = 60.0 * 60 * 24 * 365
age_in_years = AGE_IN_SECONDS / SECONDS_PER_YEAR

puts "#{AGE_IN_SECONDS} seconds are %.2f years." % age_in_years
