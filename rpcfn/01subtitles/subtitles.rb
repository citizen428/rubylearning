#!/usr/bin/env ruby
# encoding: utf-8

require 'optparse'
require 'time'
require 'fileutils'

options = {}
ARGV[0] = "-h" unless (5..6).include? ARGV.length

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename($0)} OPTIONS input_file [output_file]"
  opts.separator ''
  opts.separator 'Specific options:'
  opts.on( "-o", "--operation OPERATION", [:add, :subtract], "[add|subtract]" ) do |o|
    options[:operation] = o 
  end
  opts.on( "-t", "--time OFFSET", Float, "time offset (as float)" ) do |t| 
    options[:time] = t
  end
  opts.separator ''
  opts.on_tail("-h", "--help", "Show this help message.") { puts opts; exit }
end
begin 
  optparse.parse!
rescue OptionParser::InvalidArgument
  puts optparse.help
  exit 1
end

infile = ARGV[0]
outfile = ARGV[1] || "#{infile}.new" 
options[:time] *= -1 if options[:operation] == :subtract

shift_timestamp = -> ts do
  t = Time.parse(ts.gsub(',','.')) + options[:time]
  "#{t.strftime("%H:%M:%S")},#{t.usec.to_s[0..2]}"
end

begin
File.open(outfile, "w") do |f|
  File.open(infile).each_line do |orig_line|
    if orig_line.match(/(.*) --> (.*)/)
      start, stop = $1, $2 
      f.puts "#{shift_timestamp[start]} --> #{shift_timestamp[stop]}"
    else
      f.puts orig_line.chomp
    end
  end
end
rescue => e
  FileUtils.remove(outfile)
  puts e.message
  exit 2
end