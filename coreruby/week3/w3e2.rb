#/usr/bin/ruby
=begin
 Reads a text file (user prompted), replaces the string
 'word' with the string 'inserted word' and then writes
 back to the orignal file.
=end

change_me = 'word'
replacement = 'inserted word'

begin
  puts 'Please provide path to textfile: '
  STDOUT.flush
end until File.exists?(file=gets.chomp!)

File.open("#{file}.tmp", 'w') do |f|
  File.open(file).each_line do |line|
    f.puts line.gsub(change_me, replacement)
  end
end

File.delete(file)
File.rename("#{file}.tmp", file)
