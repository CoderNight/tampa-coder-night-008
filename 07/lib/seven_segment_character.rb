require_relative 'seven_segment_segment.rb'

class SevenSegmentCharacter
  def initialize(segments = [])
    @segments = segments
  end

  def has_segment?(segment)
    return @segments.include?(segment)
  end

  def self.initialize_from_string(input_string)
    return SevenSegmentCharacter.new(string_to_segments(input_string))
  end

private
  @@mapping = [nil, SevenSegmentSegment.top, nil,
               SevenSegmentSegment.top_left, nil, SevenSegmentSegment.top_right,
               nil, SevenSegmentSegment.middle, nil,
               SevenSegmentSegment.bottom_left, nil, SevenSegmentSegment.bottom_right,
               nil, SevenSegmentSegment.bottom, nil]

  def self.string_to_segments(input_string)
    segments = []
    input_string.split("").each_with_index do |char, index|
      unless " " == char
        segment = @@mapping[index]
        segments << segment unless segment.nil?
      end
    end
    segments
  end
end
