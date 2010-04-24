#!/usr/bin/ruby
#  Program to explore the Dir class.

# a. Display your current working directory.  
puts Dir.pwd

# b. Create a new directory tmp under your working directory. 
Dir.mkdir('./tmp') if Dir['./tmp'].empty?

# c. Change your working directory to tmp. 
Dir.chdir('./tmp')
  
# d. Display your current working directory. 
puts Dir.pwd

# e. Go back to your original directory. 
Dir.chdir('..')  

# f. Delete the tmp directory. 
Dir.rmdir('./tmp')
