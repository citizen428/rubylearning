#!/usr/bin/ruby

=begin
  Spec:
  There will be shapes on a GUI, a square, a circle and a triangle. When the 
  user clicks on a shape, the shape will rotate clockwise 360 degrees (ie. all 
  the way around) and play an AIF sound file specific to that particular shape. 

  Spec update:
  There will be an amoeba shape on the screen, with the others. When the user 
  clicks on the amoeba, it will rotate like the others, and play an AIF sound 
  file. The other figures like rectangle rotate around the center. I want the 
  amoeba shape to rotate around a point on one end, like a clock hand !

  Note: 
  This exercise is about inheritance, method overriding and method overloading 
  not about UI. 

  Note 2:
  Although it wasn't part of this exercise, I made create a set of tests which
  can be found in spec/shapes_spec.rb to learn RSpec.
=end

class Shape
  def initialize(sf=self.class.to_s)
    @soundfile = "/path/to/soundfiles/#{sf}.aif"
    @rotation_center = 'the center'
  end

  # -degrees rotates clockwise, +degrees rotates anticlockwise
  def rotate(degrees=-360)
    "Rotating #{degrees}° around #{@rotation_center}."
  end
  
  def play_sound
    "Playing #{@soundfile}."
  end
  
  def click
    rotate
    play_sound
    "A #{self.class.to_s} object was clicked."
  end
end
 
class Square < Shape
end
 
class Circle < Shape
end
 
class Triangle < Shape
end

class Amoeba < Shape
  def rotate(degrees=-360)
    @rotation_center = 'an edge point'
    super(degrees)
  end
end

