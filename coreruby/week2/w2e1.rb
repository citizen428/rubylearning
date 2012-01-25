#!/usr/bin/env ruby

s="Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

s.each_line.with_index(1) { |line, i| puts "Line #{i}: #{line}" }
