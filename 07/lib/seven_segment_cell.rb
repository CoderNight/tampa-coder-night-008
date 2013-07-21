require_relative 'seven_segment_character.rb'
require_relative 'seven_segment_segment.rb'

class SevenSegmentCell
  def initialize(seven_segment_character)
    @seven_segment_character = seven_segment_character
  end

  def character_at_index(x, y)
    return "-" if @seven_segment_character.has_segment?(@@horizontal_mappings[y][x])
    return "|" if @seven_segment_character.has_segment?(@@vertical_mappings[y][x])
    " "
  end

  def self.cell_columns
    3
  end

  def self.cell_rows
    5
  end

private
  @@horizontal_mappings = [[nil, SevenSegmentSegment.top, nil],
                           [nil, nil, nil],
                           [nil, SevenSegmentSegment.middle, nil],
                           [nil, nil, nil],
                           [nil, SevenSegmentSegment.bottom, nil]]

  @@vertical_mappings = [[nil, nil, nil],
                         [SevenSegmentSegment.top_left, nil, SevenSegmentSegment.top_right],
                         [nil, nil, nil],
                         [SevenSegmentSegment.bottom_left, nil, SevenSegmentSegment.bottom_right],
                         [nil, nil, nil]]
end
