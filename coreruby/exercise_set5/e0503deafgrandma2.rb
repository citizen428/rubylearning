#!/usr/bin/ruby
=begin
  Write a Deaf Grandma program. Whatever you say to grandma (whatever 
  you type in), she should respond with HUH?! SPEAK UP, SONNY!, unless you 
  shout it (type in all capitals). If you shout, she can hear you (or at least she 
  thinks so) and yells back, NO, NOT SINCE 1938! To make your program really 
  believable, have grandma shout a different year each time; maybe any year at 
  random between 1930 and 1950. You can't stop talking to grandma until you 
  shout BYE. 
=end

def is_all_upper?(input_string)
  input_string == input_string.upcase
end

years = (1930..1950).to_a
bye_count = 0
talk_to_grandma = ''

puts 'AYE. SO YOU FINALLY COME VISIT ME. TELL ME SOMETHING, SONNY! '
STDOUT.flush

until bye_count == 3
  talk_to_grandma = gets.chomp!
  bye_count = talk_to_grandma == 'BYE' ? bye_count += 1 : 0
  
  puts is_all_upper?(talk_to_grandma) ?
    "NO, NOT SINCE #{years[rand(years.length)]}!" :
    "HUH?! SPEAK UP, SONNY!" 
end

puts "UNGRATEFUL BASTARD! BACK IN MY DAY... METER-HIGH SNOW. UPHILL BOTH WAYS. KIDS TODAY...."

