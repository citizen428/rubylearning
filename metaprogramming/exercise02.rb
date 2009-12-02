class I
  def like arg
    puts "%s %s %s" % [self.class, self.class.instance_methods(false), arg]
  end
end

#c, m, arg = gets.split  # input 'I like metaprogramming.'
# easier testing:
c, m, arg = "I like metaprogramming".split

# write your code here to display 'I like metaprogramming.'
Object.const_get(c).new.send(m, arg)

# A more explicit way to write the above
obj = Object.const_get(c).new
obj.send(m, arg)
