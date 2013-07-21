#!/usr/bin/env ruby
# encoding: utf-8

require "optparse"

LCD=["- -- -----",
     ["|   ||| ||", "|||||  |||"],
     "  ----- --",
     ["| |   | | ", "|| |||||||"],
     "- -- -- --"]

def lcd(str, size)
  numbers = str.chars.map(&:to_i)
  [ numbers.map { |n| " " + LCD[0][n]*size + " " }.join ] +
  [ numbers.map { |n| LCD[1][0][n] + " "*size + LCD[1][1][n] }.join ]*size +
  [ numbers.map { |n| " " + LCD[2][n]*size + " " }.join ] +
  [ numbers.map { |n| LCD[3][0][n] + " "*size + LCD[3][1][n] }.join ]*size +
  [ numbers.map { |n| " " + LCD[4][n]*size + " " }.join ]
end

size = 1
ARGV.options do |opt|
  opt.on("-s <size>", Integer, "Size of LCD") { |s| size = s }
end.parse!

if ARGV.size == 1
  puts lcd(ARGV[0], size)
else
  puts ARGV.options.banner
end
