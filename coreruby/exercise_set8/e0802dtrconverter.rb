#!/usr/bin/ruby

=begin
  You are using a class (say DTRConvertor) that's got a bug in one of its methods 
  (the bug is that the conversion rate is Rs 38). You know where the bug is and how 
  to fix it, but you can?t or don?t want to change the source file itself. Write 
  code to do it. 

  NOTE: This script includes several solutions to show various approaches to this
  problem.
=end

class DTRConvertor
 def convert(dollar_amount)
   dollar_amount * 40.0 # Bug here
 end
end

# Solution 1 
#m.instance_eval do
#  alias :old_convert :convert
#  def convert(dollar_amount, conversion_rate=38)
#    dollar_amount * conversion_rate
#  end
#end
#
# Use like this:
# puts m.convert(100.0)
# puts m.old_convert(100.0)

# Solution 2
#def DTRConvertor.convert(dollar_amount, conversion_rate=38)
#      dollar_amount * conversion_rate
#end
#
# Use like this:
#m = DTRConvertor.new
#puts m.convert(100.0)
#puts m.class.convert(100.0)

# Solution 3
# Due to discussion with Jeff Hales
class DTRConvertor
  @@conversion_rate = nil

  def initialize(*args)
    @@conversion_rate = args[0] if args[0]
  end

  def conversion_rate=(c_rate)
    @@conversion_rate = c_rate
  end

  def convert(*args)    
    if args.length == 1 
      if @@conversion_rate 
	args[0] * @@conversion_rate
      else
	args[0] * 40
      end
    else
      args[0] * args[1]
    end
  end
end

m = DTRConvertor.new
 
# Usage examples for solution 3:
# older scripts now using the new version:
puts m.convert(100.0)      
puts m.convert(100.0)*0.95 
 
# newer scripts taking advantage of improved functionality:
puts m.convert(100.0, 37.5)
puts m.convert(100.0, 42.0)
puts

# More convenient way to use the new library
m2 = DTRConvertor.new 38.0
puts m2.convert(100.0)
puts

# Alternative way to take advantage of the improved functionality:
m3 = DTRConvertor.new
n = DTRConvertor.new
o = DTRConvertor.new

puts m3.convert(100.0) 
m3.conversion_rate = 38.0
puts m3.convert(100.0)
puts n.convert(100.0)     # <= also uses the new conversion rate
puts o.convert(100.0, 37)
