#/usr/bin/ruby
=begin
  Write a Ruby program that prints the numbers from 1 to 100. But for 
  multiples of three print "Fizz" instead of the number and for multiples of five 
  print "Buzz". For numbers which are multiples of both three and five print 
  "FizzBuzz". 
=end

puts "'Classic' approach:"
(1..100).each do |num|
  word = ''
  word << "Fizz" if num % 3 == 0
  word << "Buzz" if num % 5 == 0 
  word = num if word.empty?
  puts word
end

puts "'Funky' approach:"
1.upto(100) do |n|
  puts ['FizzBuzz', 'Fizz', 'Buzz', n][[n%15, n%3, n%5, 0].index(0)]
end

puts "Using Hash.new:"
fb = Hash.new do |h, k|
  str = ''
  str << 'Fizz' if k % 3 == 0
  str << 'Buzz' if k % 5 == 0
  fb[k] = str.empty? ? k : str
end
(1..100).each { |x| puts fb[x] }

puts "Lambda approach:"
fb = (0..100).to_a
m = lambda { |x, s| (x..100).step(x) { |i| fb[i].is_a?(String) ? fb[i] += s : fb[i] = s } }
replacements = { 3 => "Fizz", 5  => "Buzz", 7  => "Dazz" }

replacements.sort.each { |k,v| m[k, v] }
puts fb[1..-1]

=begin
  # The lambda version in Ruby 1.9.1
  
  fb = (0..100).to_a
  m = -> x, s { (x..100).step(x) { |i| fb[i].is_a?(String) ? fb[i] += s : fb[i] = s } }
  replacements = { 3 => "Fizz", 5  => "Buzz", 9  => "Dazz" }

  replacements.each { |k,v| m[k, v] }
  puts fb[1..-1]
=end
