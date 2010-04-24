#!/usr/bin/ruby

=begin
  Let's say you want to run some Ruby code (such as a call to a shell command) repeatedly 
  at a certain interval (for example, once every five seconds for one minute). Write a 
  method for this. Do not use Thread class for now. Hint: yield and sleep methods may be required.
=end

def repeat_call(interval, repetitions=2)
  repetitions.times do |i|
    yield
    # no sleep after last repetition
    sleep interval if i < repetitions - 1
  end
end

# example usage
repeat_call(5) { system('date') } 
