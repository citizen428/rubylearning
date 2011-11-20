#!/usr/bin/ruby
# -*- coding: utf-8 -*-

=begin
  * If it is the "nature" of an UnpredictableString object to be unpredictable,
    why do we need to call a method to make it happen? By implementing to_s as
    shown below, a different string (or even the original) will be displayed
    every time we output an UnpredictableString object.
  * However, if we subclass String this will not work anymore, because strings
    get treated differently in Ruby, so there won't be a call to to_s or to_str
    (the reason seems to be 'rb_obj_as_string' which is what 'rb_io_puts' calls).
  * To get the best of both worlds, I decided NOT to subclass String but instead
    use method_missing to forward messages to the String class.
=end

class UnpredictableString
  def initialize(str='')
    @original = str
  end

  attr_reader :original

  def scramble
    original.split(//).sort_by{rand}.join
  end

  def method_missing(m, *args, &block)
    to_s.send(m, *args, &block)
  end

  def to_s
    rand(2) % 2 == 0 ? scramble : original
  end

  alias :to_str :to_s
end

mystr = UnpredictableString.new('It was a dark and stormy night.')
print "Unscrambled string: "
puts mystr.original
puts "---"

3.times do |i|
  print "Unpredictable string ##{i+1}: "
  puts mystr
  puts "---"
end

print "The original is still untouched: "
puts mystr.original
puts "---"

print "Testing message forwarding: "
puts mystr.gsub(/i/) { '*i*' }
