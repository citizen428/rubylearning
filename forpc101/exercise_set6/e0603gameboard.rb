=begin
  Here are the program specifications for a simple game to be played against the 
  computer.  
   
  a. This game is played at the command-line. 
  b. The game starts when the computer selects three consecutive cells in a 7 
  cell row (from 0 to 6). When that's complete, the game asks for your first 
  guess. 
  c. Guess the computer's selected cells in the smallest number of guesses. You 
  are given a rating or level, based on how well you perform. 
  d. At the command line, the user types in a number from 0 to 6. The computer 
  checks if it's one of the selected cells. If it's a hit, increment the no_of_hits 
  variable. In response to your guess, you'll see a result at the command-line: 
  either "Hit", "Miss" or "End". 
  e. When you have guessed all three cells, the game ends by printing out your 
  rating (your number of guesses). 
   
  Note: 
  a. Use only the features we have learned so far, in Ruby. 
  b. You must design the GameBoard class. 
  c. The e0603testgameboard.rb program uses your GameBoard class   
=end

class GameBoard

  def initialize(cells=7, hits=3)
    raise "Wrong Arguments: hits > cells" if hits > cells

    @gameboard = Array.new
    @cells = cells
    @cells.times { @gameboard.push(nil) }
    @hits_to_win = hits

    @no_of_hits = 0
  end

  attr_reader :cells, :hits_to_win, :no_of_hits

  def new
    @gameboard
  end

  def set_locations_cells(locations)
    locations.each { |i| @gameboard[i] = true }
  end

  def check_yourself(user_guess)
    user_guess = user_guess.to_i

    if @gameboard[user_guess]
      @gameboard[user_guess] = nil
      @no_of_hits += 1
      puts 'Hit'
    else
      puts 'Miss'
    end

    unless @gameboard.include?(true)
      puts 'End'
      'kill'
    end
  end

end

