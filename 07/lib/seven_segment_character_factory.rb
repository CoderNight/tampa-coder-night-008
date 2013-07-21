require_relative "seven_segment_characters.rb"

class SevenSegmentCharacterFactory
  def initialize
    @char_mappings = Hash.new(SevenSegmentCharacters.charNil)
    @char_mappings["0"] = SevenSegmentCharacters.char0
    @char_mappings["1"] = SevenSegmentCharacters.char1
    @char_mappings["2"] = SevenSegmentCharacters.char2
    @char_mappings["3"] = SevenSegmentCharacters.char3
    @char_mappings["4"] = SevenSegmentCharacters.char4
    @char_mappings["5"] = SevenSegmentCharacters.char5
    @char_mappings["6"] = SevenSegmentCharacters.char6
    @char_mappings["7"] = SevenSegmentCharacters.char7
    @char_mappings["8"] = SevenSegmentCharacters.char8
    @char_mappings["9"] = SevenSegmentCharacters.char9
  end

  def get_characters(input_string)
    input_string.split("").map do |char_token|
      self.get_character(char_token)
    end
  end

  def get_character(input_character)
    @char_mappings[input_character]
  end
end
