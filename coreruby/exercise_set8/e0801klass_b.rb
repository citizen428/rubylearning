#!/usr/bin/ruby

=begin
Write a Ruby program named lesson8exercise1.rb that defines a class called Klass which will be 
called in another program as follows:

obj = Klass.new("hello")
puts obj.say_hello

where say_hello is a method in that class, which returns the string sent when an object of Klass 
is created. Write another program named lesson8exercise1a.rb that creates an object of the class 
defined in program lesson8exercise1.rb and then marshals it and then restores it.
=end

require 'e0801klass_a'

obj = Klass.new("hello")
puts 'Orginal object: ' + obj.say_hello


File.open('klass_marshal', 'w+') do |f|  
    Marshal.dump(obj, f)  
end  

new_object = nil

File.open('klass_marshal') do |f|  
    new_object = Marshal.load(f)  
end  
 
puts 'New object: ' + new_object.say_hello
