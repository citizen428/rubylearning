#/usr/bin/ruby
=begin
 Reads a text file (user prompted), replaces the string
 'word' with the string 'inserted word' and then writes
 back to the orignal file.
=end

change_me = 'word'
replacement = 'inserted word'
filename = ''

begin
  puts 'Please provide path to textfile: '
  STDOUT.flush
end until File.exists?(filename=gets.chomp!)

text = IO.read(filename)

File.open(filename, 'w') do |fn|
	text.gsub!(change_me, replacement) 
	fn.puts "#{text}"
end

