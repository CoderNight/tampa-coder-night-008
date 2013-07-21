#!/usr/bin/env ruby

require_relative 'lib/gpu'

number = ARGV[0]
size   = 3

gpu = Gpu.new(number,size)
gpu.output

#options = {}
#
#parser   = OptionParser.new do |opts|
#  opts.banner = "Usage: lcd [options]"
#  opts.on("-s", "--size INTEGER", "The size of the number display.") do |s|
#    options[:size] = s
#  end
#end
#parser.parse!
