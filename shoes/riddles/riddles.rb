=begin
  RubyLearning Ruby Programming with Shoes 101
  Exercise 1: Create your own Riddles in Shoes

  Author: Michael Kohl <citizen428@gmail.com>

  Tested on Mac OS X Leopard, Ubuntu 8.10 and
  Windows XP with Shoes raisins (0.r1134). 

  FIXME: Riddles could be read from file 
  FIXME: Move constants and methods to class/module
=end

# constants used throughout the app
APP_NAME = 'Riddles in Shoes'
APP_VERSION = 0.6

WIN_WIDTH = 400
WIN_HEIGHT = 400

RIDDLES = [
['What letter is a drink?', 't'], 
['What has nothing but a head and a tail?', 'coin'], 
['What is it that by losing an eye has nothing left but a nose?', 'noise'], 
['What bird can lift the heaviest weight?', 'crane'], 
['What is broken when you name it?', 'silence'], 
['What is a foreign ant?', 'important'], 
['What lives on its own substance and dies when it devours itself?', 'candle'], 
['Yesterday is always before today. But there is a place where yesterday always follows today. Where?', 'dictionary'], 
['How many cookies can you eat on an empty stomach?', 'one'], 
['What clothing does a house wear?', 'address']
]
NUM_QUESTIONS = 10

# app starts here
Shoes.app :title => "#{APP_NAME} #{APP_VERSION}", 
  :width => WIN_WIDTH, :height => WIN_HEIGHT, :resizable => false do

  # see 'Enumberable#sort_by' if you don't understand this
  def questions_array()
    (0..NUM_QUESTIONS-1).sort_by { rand }
  end

  def initialize_game()
    @questions_asked = @correct = 0
    @random = questions_array
  end

  def get_question(index)
    @questions_asked += 1
    @riddle.text = RIDDLES[index][0]
    @last_question = index
  end

  def score_question(result)
    if result
      @correct +=1
      @stars[@last_question].style(:fill => green)
    else
      @stars[@last_question].style(:fill => red)
    end
    update_score
  end

  def update_score()
    @display_score.text = 
      "You got #{@correct} / #{@questions_asked} questions right!"
  end

  def check_answer()
    @user_answer.text.upcase == RIDDLES[@last_question][1].upcase 
  end
  
  # depending on the stage of the game, different slots are shown
  def toggle_active()
    @question.toggle
    @answer.toggle
    @gameover.toggle
  end

  # every time the app starts it gets a random background gradient
  background white..COLORS.values[rand(COLORS.values.length)]

  # @header and @question have fixed heights so the answers section
  # doesn't move around during the game
  @header = stack :height => '20%' do
    title("#{APP_NAME}", :align => 'center', :underline => 'single')

    # create an array of stars
    # spacing is calculated like this:
    # window width - 20px border on each side
    # divided by number of spacings needed (1 less than # of questions)
    @stars = []
    spacing = (WIN_WIDTH - 2 * 20) / (NUM_QUESTIONS - 1)

    NUM_QUESTIONS.times do |i| 
      @stars.push(star(20 + spacing * i, 70, :points => 8, 
	:outer => 10, :inner => 5)) 
    end
  end

  initialize_game

  @question = stack :height => '30%' do
    subtitle 'Question'
    @riddle = para
    get_question(@random.pop)
  end

  @answer = stack do
    subtitle 'Answer'
    flow do
      @user_answer = edit_line
      button 'Ok' do
	      score_question(check_answer) 
	      @user_answer.text = ''
	      @random.empty? ? toggle_active : get_question(@random.pop)
      end
    end
  end

  @gameover = stack do
    # hack to align the buttons in the center by
    # putting to flows within another flow 
    flow do
      flow :width => WIN_WIDTH/4
      flow :width => -WIN_WIDTH/4 do
	button 'Play again', :width => WIN_WIDTH/4 do
	  initialize_game
	  update_score
	  toggle_active
	  @stars.each { |s| s.style(:fill => black) }
	  get_question(@random.pop)
	end
	button('Quit', :width => WIN_WIDTH/4) { exit }
      end
    end
  end
  @gameover.hide

  @score = stack do
    subtitle 'Score'
    @display_score = tagline :align => 'center'
    update_score
  end

end
