=begin
  Write code that outputs the following:

  1
  2
  3
  11
  22
  33
=end

ret = class A 
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end
  @a = 1
  @@a = 2
  a = 3
end

puts A.instance_eval("@a") 
puts A.class_eval("@@a") 
puts ret 
obj = A.new
puts obj.instance_eval('@a') 
puts A.class_eval('@@a') 
puts obj.send(:initialize)

