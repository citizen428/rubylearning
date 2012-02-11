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

STDOUT.sync = true

puts 'AYE. SO YOU FINALLY COME VISIT ME. TELL ME SOMETHING, SONNY! '

until (you_say = gets.chomp!) == 'BYE'
  puts you_say == you_say.upcase ?
    "NO, NOT SINCE #{rand(1930..1951)}!" :
    "HUH?! SPEAK UP, SONNY!"
end

puts "UNGRATEFUL BASTARD! BACK IN MY DAY... METER-HIGH SNOW. UPHILL BOTH WAYS. KIDS TODAY...."
