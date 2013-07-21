#!/usr/bin/env ruby

require 'optparse'
require_relative 'lib/seven_segment_display_formatter.rb'

size_multiplier = 2
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: lcd.rb [options] numeric_display_string"
  opts.on( '-s', "--size_multiplier=val", Integer) do |multiplier_option|
    size_multiplier = multiplier_option if (multiplier_option > 0)
  end
end

if __FILE__ == $0
  optparse.parse!
  if ARGV.empty?
    puts optparse
  else
    puts SevenSegmentDisplayFormatter.new.format(ARGV[0], size_multiplier)
  end
end
