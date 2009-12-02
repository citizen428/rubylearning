# There are lots of ways to define singleton method.
# define singleton speak() method

# Version 1:
# def animal.speak
animal = 'dog'

def animal.speak
  "#{self.capitalize} says Woof!"
end

animal.speak # => "Dog says Woof!"
animal.singleton_methods # => ["speak"]

# Version 2:
# singleton class
animal2 = 'cat'

class << animal2
  def speak2
    "#{self.capitalize} says Meow!"
   end
end

animal2.speak2 # => "Cat says Meow!"
animal2.singleton_methods # => ["speak2"]

# Version 3:
# define_method
animal3 = 'cow'

(class << animal3; self; end).module_eval do
  define_method :speak3 do
    "#{self.capitalize} says Mooh!"
  end
end

animal3.speak3 # => "Cow says Mooh!"
animal3.singleton_methods # => ["speak3"]

# Version 4:
# instance_eval
animal4 = 'wolf'

animal4.instance_eval do
  def speak4
    "#{self.capitalize} says Grrr!"
  end
end

animal4.speak4 # => "Wolf says Grrr!"
animal4.singleton_methods # => ["speak4"]

# Version 5:
# module, extend

module Speak
  def speak5
    "#{self.capitalize} says Yada!"
  end
end

animal5 = 'bunny'
animal5.extend(Speak)

animal5.speak5 # => "Bunny says Yada!"
animal5.singleton_methods # => ["speak5"]

# Version 6:
# module, include
animal6 = 'unicorn'

module Speak2
  def speak6
    "#{self.capitalize} says Candy Mountain!"
  end
end

class << animal6
  include Speak2
end

animal6.speak6 # => "Unicorn says Candy Mountain!"
animal6.singleton_methods # => ["speak6"]

# Version 7:
# send, lambda
animal7 = 'squirrel'

(class << animal7; self; end).send(:define_method, :speak7, lambda  { "#{self.capitalize} says Woohoo!" })

animal7.speak7 # => "Squirrel says Woohoo!"
animal7.singleton_methods # => ["speak7"]
