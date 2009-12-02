=begin
  RubyLearning Ruby Programming with Shoes 101
  Exercise 2: Dog Hunts Sheep game

  Author: Michael Kohl <citizen428@gmail.com>
 
  TODO: Cleanup code, move functions etc. to external file
=end

# constants used throughout the app
APP_NAME = 'Dog Hunts Sheep'
APP_VERSION = 0.4
BACKGROUND = './images/pasture.jpg'
DOG = './images/dog.png'
FRAMES = 25
IMAGE_HW = 24
NUM_SHEEP = 25
SHEEP = './images/sheep.png'
WIN_HEIGHT = 446
WIN_WIDTH = 600

# app starts here
Shoes.app :title => "#{APP_NAME} #{APP_VERSION}", 
  :width => WIN_WIDTH, :height => WIN_HEIGHT, :resizable => false do

  def baa index
    baa = para "Baa!"
    baa.hide

    baa.move @sheep[index].left, @sheep[index].top + 10
    baa.show
  end

  def woof left, top
    woof = para "Woof!", :stroke => red
    woof.hide
    
    woof.move left, top
    woof.show
    timer(3) { woof.remove }
  end

  def top_reached?(index)
    @sheep[index].top <= 0
  end

  def sheep_move
    freed = []
    (0..NUM_SHEEP-1).sort_by {rand}.each do |i|
      @sheep[i].move @sheep[i].left + (-4..4).to_a[rand(9)], @sheep[i].top - rand(5) unless top_reached?(i)
      @free += 1 if (top_reached?(i) && !@sheep[i].hidden)
    end
  end 

  def sheep_capture x, y, sheep_arr
    sheep_arr.each_with_index do |sheep, index| 
      if (x-15..x+15).include?(sheep.left) && (y-15..y+15).include?(sheep.top)
	unless sheep.hidden
	  @caught += 1
	  woof sheep.left, sheep.top
	  star sheep.left, sheep.top, :points => 6, :outer => 10, :inner => 6, :fill => deepskyblue
	  @caught_sheep.push(sheep)
	  @sheep[index].hide
	end
      end
    end
  end

  image BACKGROUND

  @sheep = []

  NUM_SHEEP.times do |i|
    @sheep.push(image(SHEEP, :left => 7 + i * 23, :top => WIN_HEIGHT - IMAGE_HW))
  end

  @caught = 0
  @free = 0
  @caught_sheep = []
  @stopped = false

  @dog = image DOG, :left => WIN_WIDTH/2, :top => WIN_HEIGHT/2

  sheep_run = animate FRAMES do
    sheep_move
    
    keypress do |k|
      case k
	when :up    : @dog.move @dog.left, @dog.top-20 unless @dog.top < 0
	when :down  : @dog.move @dog.left, @dog.top+20 unless @dog.top > WIN_HEIGHT
	when :left  : @dog.move @dog.left-20, @dog.top unless @dog.left < 0
	when :right : @dog.move @dog.left+20, @dog.top unless @dog.left > WIN_WIDTH
      end
    end

    sheep_capture @dog.left, @dog.top, @sheep
    @stopped = true if @caught + @free >= 25
    if @stopped
      sheep_run.stop
      @caught_sheep.each_with_index do |sheep, index| 
	sheep.move(7 + index * 23, WIN_HEIGHT - IMAGE_HW) 
	sheep.show
      end
      @sheep.each_index { |i| baa(i) unless @caught_sheep.include?(@sheep[i]) }
      alert "You caught #{@caught} out of #{NUM_SHEEP} sheep!"
    end
   end

end
