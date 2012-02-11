#!/usr/bin/ruby
=begin
Your text analyzer will provide the following basic statistics:

Character count
Character count (excluding spaces)
Line count
Word count
Sentence count
Paragraph count
Average number of words per sentence
Average number of sentences per paragraph
=end

begin
  puts 'Please provide path to textfile: '
  STDOUT.flush
end until File.exists?(file=gets.chomp!)

lines = chars = chars_no_ws = words = sentences = 0
# start at 1, first paragraph isn't preceded by an empty line
paragraphs = 1

# open file and get stats
File.open(file, 'r').each_line do |line|
  lines += 1
  chars += line.strip.length
  chars_no_ws += line.scan(/\S/).length
  words += line.strip.split.length
  sentences += line.count('.!?')
  paragraphs += 1 if line =~ /^\s+$/
end

avg_words_sentence = words / sentences
avg_sentences_paragraph = sentences / paragraphs

puts %{
Lines: #{lines}
Characters: #{chars}
Characters (w/o whitespace): #{chars_no_ws}
Words: #{words}
Sentences: #{sentences}
Paragraphs: #{paragraphs}
Average words sentence: #{avg_words_sentence}
Average sentences paragraph: #{avg_sentences_paragraph}
}
