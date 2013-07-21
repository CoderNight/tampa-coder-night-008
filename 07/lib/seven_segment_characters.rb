require_relative 'seven_segment_character.rb'

class SevenSegmentCharacters

  def self.charNil
    @@charNil ||= SevenSegmentCharacter.initialize_from_string("   "\
                                                               "   "\
                                                               "   "\
                                                               "   "\
                                                               "   ")
  end

  def self.char0
    @@char0 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "x x"\
                                                             "x x"\
                                                             "x x"\
                                                             "xxx")
  end

  def self.char1
    @@char1 ||= SevenSegmentCharacter.initialize_from_string("   "\
                                                             "  x"\
                                                             "  x"\
                                                             "  x"\
                                                             "   ")
  end

  def self.char2
    @@char2 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "  x"\
                                                             "xxx"\
                                                             "x  "\
                                                             "xxx")
  end

  def self.char3
    @@char3 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "  x"\
                                                             "xxx"\
                                                             "  x"\
                                                             "xxx")
  end

  def self.char4
    @@char4 ||= SevenSegmentCharacter.initialize_from_string("   "\
                                                             "x x"\
                                                             "xxx"\
                                                             "  x"\
                                                             "   ")
  end

  def self.char5
    @@char5 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "x  "\
                                                             "xxx"\
                                                             "  x"\
                                                             "xxx")
  end

  def self.char6
    @@char6 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "x  "\
                                                             "xxx"\
                                                             "x x"\
                                                             "xxx")
  end

  def self.char7
    @@char7 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "  x"\
                                                             "  x"\
                                                             "  x"\
                                                             "   ")
  end

  def self.char8
    @@char8 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "x x"\
                                                             "xxx"\
                                                             "x x"\
                                                             "xxx")
  end

  def self.char9
    @@char9 ||= SevenSegmentCharacter.initialize_from_string("xxx"\
                                                             "x x"\
                                                             "xxx"\
                                                             "  x"\
                                                             "xxx")
  end
end
