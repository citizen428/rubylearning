#!/usr/bin/ruby

=begin
  Write a class called Person, that has balance as an instance variable and 
  the following public method: show_balance. 

  I shall create the Person object as follows:

  p = Person.new(40000)

  puts p.show_bal # calling the method
  In the above code, 40000 is the amount of the initial balance.
=end

class Person
  def initialize(bal)
    @balance = bal
  end
 
  def show_balance
    @balance
  end

  alias :show_bal :show_balance
end

p = Person.new(40000)

puts p.show_bal
