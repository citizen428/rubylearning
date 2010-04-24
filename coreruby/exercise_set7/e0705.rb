class Game
  def save_game(file, score)
    open(file, "w") do |f|
      f.puts(score)
      f.puts(Time.new.to_i)
    end
  end

  def load_game(file)
    open(file, "r") do |f|
      @score = f.gets.to_i
      @saved_time = f.gets.to_i
    end
    real_save = File.mtime(file).to_i

    raise RuntimeError, 'I suspect you of cheating' if real_save != @saved_time
  end

  attr_reader :saved_time, :score
end

# Test code
g = Game.new
save_file = 'game.sav'
g.save_game(save_file, 1000)
sleep(2)
g.load_game(save_file)
puts "You saved a score of #{g.score} at #{Time.at(g.saved_time)}."

# Cheat attempt
open(save_file, 'r+b') { |f| f.write('9') }
sleep(2)
g.load_game(save_file)



