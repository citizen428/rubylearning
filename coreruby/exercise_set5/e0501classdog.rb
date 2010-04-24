class Dog

  def initialize(name)
    @name = name
  end
  
  def bark
    "#{@name} says woof!"
  end
  
  def eat
    "#{@name} eats from the dog bowl!"
  end
  
  def chase_cat
    "#{@name} chases the cat!"
  end
 
  def teach_trick(name, &block)
    (class << self; self; end).send(:define_method, name, block)
  end
 
  def method_missing(m, *args)
    "#{@name} doesn't know how to #{m}!"
  end
 
end
 
d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.dance 
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.poo
puts d.singleton_methods
puts
d2=Dog.new('Fido')
puts d2.dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
puts d2.laugh
puts d.laugh
puts d2.singleton_methods
puts
d3=Dog.new('Stimpy')
puts d3.dance
puts d3.laugh
# >> Lassie is dancing!
# >> Lassie is a smelly doggy!
# >> 
# >> Fido doesn't know how to dance!
# >> Fido finds this hilarious!
# >> Lassie doesn't know how to laugh!
# >> 
# >> Stimpy doesn't know how to dance!
# >> Stimpy doesn't know how to laugh!
