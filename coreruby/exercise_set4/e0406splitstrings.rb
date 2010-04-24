#!/usr/bin/ruby
=begin
   Given a string s = 'key=value', create two strings s1 and s2 such that s1 
   contains key and s2 contains value. Hint: Use some of the String functions.  
=end

s = 'key=value'

s1, s2 = s.split('=')

puts "s1: #{s1}"
puts "s2: #{s2}"
