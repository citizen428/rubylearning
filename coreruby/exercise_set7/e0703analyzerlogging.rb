#!/usr/bin/ruby
=begin
  Class to analyze text files. 
  Including example usage.

  E0703: Modify your TextAnalyzer program to add the logging feature.
=end

require 'logger'

class TextAnalyzer

  def initialize(file_to_analyze)
    @file_to_analyze = file_to_analyze
    @line_count = 0
    @scan_string = ''

    # for the purpose of this exercise we log to STDOUT
    @ta_log = Logger.new('talog.txt', 'monthly')
    
    file = File.new(@file_to_analyze, "r")
    while (line = file.gets)
      @line_count += 1
      @scan_string << line 
    end
    file.close
    @ta_log.info("TextAnylyzer started - Analyzing #{file_to_analyze}")
  end
  
  def line_count
    @line_count
  end

  def char_count
    @scan_string.length
  end

  def char_count_no_whitespace
    # substitute whitespace by an empty string
    @scan_string.gsub(/\s/, '').length
  end

  def word_count
    # paragraphs are two whitespaces in a row
    # not giving a range increases the word
    # count since 'empty words' get added 
    @scan_string.split(/\s{1,2}/).length
  end

  def sentence_count
    # sentences end at '.', '!' or '?' followed
    # by one (normal sentence) or two (paragraph)
    # whitespaces
    @scan_string.split(/[.!?]\s{1,2}/).length
  end

  def paragraph_count
    @scan_string.split("\n\n").length
  end

  def words_per_sentence
    sentence_count != 0 ? word_count.to_f / sentence_count : 0
  end

  def sentences_per_paragraph
    paragraph_count != 0 ? sentence_count.to_f / paragraph_count : 0
  end

  def log(message, level='info')
    eval("@ta_log.#{level} message")
  end
end

# main program starts here
file_to_analyze = ''
until File.exist?(file_to_analyze)
  print 'Which file do you want to analyze? '
  STDOUT.flush
  file_to_analyze = gets.chomp!
end

analyzed = TextAnalyzer.new(file_to_analyze)

puts "-----"
puts "Statistics for '#{file_to_analyze}':"
puts "-----"
puts "Line count: #{analyzed.line_count}" 
puts "Character count: #{analyzed.char_count}"
puts "Char. count w/o Whitesp.: #{analyzed.char_count_no_whitespace}"
puts "Word count: #{analyzed.word_count}"
puts "Sentence count: #{analyzed.sentence_count}"
puts "Paragraph count: #{analyzed.paragraph_count}"
puts "Words/sentence: #{"%.2f" % analyzed.words_per_sentence}"
puts "Sentences/paragraph #{"%.2f" % analyzed.sentences_per_paragraph}"
analyzed.log("Completed analysis of #{file_to_analyze}")
