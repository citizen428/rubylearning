#!/usr/bin/ruby
=begin
    Use this array quiz: quiz = [0,0,0,1,0,0,1,1,0,1] (0 = not attempted, 1 = attempted)
    and write another clever program to solve my problem. That is display the 
    number of participants who have not attempted Quiz 1. 
=end

quiz = [0,0,0,1,0,0,1,1,0,1]

puts "#{quiz.grep(0).length} out of #{quiz.length} participants did not take the quiz." 

puts "#{(quiz-[1]).size} out of #{quiz.length} participants did not take the quiz."

# Batch 12 solution by Jody Baty
puts "#{quiz.sort.index(1) || quiz.length} out of #{quiz.length} participants did not take the quiz."

puts "#{quiz.to_s.count('0')} out of #{quiz.length} participants did not take the quiz."

