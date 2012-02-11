#!/usr/bin/ruby
=begin
  Given a string, let us say that we want to reverse the word order (rather
  than character order). You can use String#split, which gives you an array of
  words. The Array class has a reverse method; so you can reverse the array and
  use join to make a new string. Write this program.
=end

puts 'Please enter the string to be reversed: '
STDOUT.flush

puts gets.chomp.split.reverse.join(' ')
