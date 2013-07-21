#!/usr/bin/env ruby
# encoding: utf-8

require "optparse"

LCD=["- -- -----",
     ["|   ||| ||", "|||||  |||"],
     "  ----- --",
     ["| |   | | ", "|| |||||||"],
     "- -- -- --"]

size = 1
ARGV.options do |opt|
  opt.on("-s <size>", Integer, "Size of LCD") { |s| size = s }
end.parse!

if ARGV.size == 1
  puts [0,2,4].map {|row|
    ARGV[0].chars.map(&:to_i).map { |n|
      " " + LCD[row][n]*size + "  "
    }.join
  }.zip(
    [1,3].map {|row|
      (1..size).map {
        ARGV[0].chars.map(&:to_i).map { |n|
          LCD[row][0][n] + " "*size + LCD[row][1][n] + " "}.join
      }
    }).join("\n")
else
  puts ARGV.options.banner
end
