#!/usr/bin/ruby

=begin
   An example program to test the GameBoard class
   (e0603gameboard.rb).
=end

# testgameboard.rb 
require 'e0603gameboard' 
 
# track how many guesses the user makes 
no_of_guesses = 0 
 
# instantiate a GameBoard object 
gb = GameBoard.new() 
 
# make a random number for the first cell, 
# and use it to make the cell locations array 
random_no = rand(gb.cells-gb.hits_to_win)
locations = []
0.upto(gb.hits_to_win-1) do |i|
  locations.push(random_no+i)
end  

# invoke the setter method of the GameBoard 
gb.set_locations_cells(locations) 
 
# variable to track if the game is alive 
is_alive = true 
 
while is_alive 
  puts 'Enter a number: ' 
  STDOUT.flush 
  user_guess = gets.chomp 
  # invoke the check_yourself method on 
  # the GameBoard object 
  result = gb.check_yourself(user_guess) 
  no_of_guesses += 1 
  if (result == 'kill') 
    is_alive = false 
    puts "You took #{no_of_guesses} guesses" 
  end 
end

