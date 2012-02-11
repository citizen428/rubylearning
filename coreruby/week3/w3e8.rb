#/usr/bin/ruby
=begin
  Write a Ruby program that prints the numbers from 1 to 100. But for
  multiples of three print "Fizz" instead of the number and for multiples of five
  print "Buzz". For numbers which are multiples of both three and five print
  "FizzBuzz".
=end

def fizz_buzz(range=1..100, replacements={3 => "Fizz", 5 => "Buzz"})
  range.each do |num|
    s = replacements.inject("") { |s, (n, w)| num % n == 0 ? s << w : s }
    puts s.empty? ? num : s
  end
end

fizz_buzz
