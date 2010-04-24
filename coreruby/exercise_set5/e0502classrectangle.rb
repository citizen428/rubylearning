#!/usr/bin/ruby
=begin
  Write a Rectangle class. I shall use your class as follows: 
  r = Rectangle.new(23.45, 34.67) 
  puts 'Area is = ' + r.area().to_s 
  puts 'Perimeter is = ' + r.perimeter.to_s 
=end

class Rectangle
  def initialize(width, height) 
    @area = width * height
    @perimeter = 2 * (width + height)
  end 
  
  attr_reader :area, :perimeter
end

r = Rectangle.new(23.45, 34.67)
puts 'Area is = ' + r.area().to_s 
puts 'Perimeter is = ' + r.perimeter.to_s

