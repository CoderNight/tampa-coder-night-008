#!/usr/bin/env ruby
# encoding: utf-8

require "optparse"

NUMBERS = (0..9).map {|n| File.read(n.to_s).split("\n") }
size = 1

def lcd(str, size)
  rows = (0..4).map { |row_idx|
    str.chars.map(&:to_i).map { |n|
      NUMBERS[n][row_idx].chars.map.with_index { |ch, col_idx|
        if col_idx == 0
          ch
        elsif col_idx == 2
          ch + ' '
        else
          ch*size
        end
      }
    }.join
  }
  [3,1].each { |row_idx| (size-1).times { rows.insert(row_idx, rows[row_idx]) } }
  rows
end

describe "lcd" do
  it "should work" do
    puts lcd("012345", 1)
    puts lcd("012345", 2)
    puts lcd("012345", 3)
  end
end
