#!/usr/bin/ruby

=begin
  Write a method last_modified(file) that takes a file name and displays something like 
  this: file was last modified 125.873605469919 days ago. Use the Time class.
=end

def last_modified(file)
   Time.now - File.new(file).mtime
end

def secs_to_days(secs, format="%.2f")
  format % (secs.to_f / 60 / 60 / 24)
end

# quick and dirty test code, no checks
file = __FILE__
puts "'#{file}' was last modified #{secs_to_days(last_modified(file))} days ago."
