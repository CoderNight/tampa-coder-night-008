require_relative '../spec_helper.rb'

describe "A SevenSegmentCharacter" do
  describe "initialization" do
    it "can be initialized (no arguments)" do
      SevenSegmentCharacter.new.should_not be_nil
    end

    it "can be initialized with a list of segments" do
      SevenSegmentCharacter.new(:segments).should_not be_nil
    end

    describe "string initialization" do
      it "can be initialized with a string (nil)" do
        input_string = \
          "   "\
          "   "\
          "   "\
          "   "\
          "   "
        char = SevenSegmentCharacter.initialize_from_string(input_string)

        char.has_segment?(SevenSegmentSegment.top).should be_false
        char.has_segment?(SevenSegmentSegment.top_left).should be_false
        char.has_segment?(SevenSegmentSegment.top_right).should be_false
        char.has_segment?(SevenSegmentSegment.middle).should be_false
        char.has_segment?(SevenSegmentSegment.bottom_left).should be_false
        char.has_segment?(SevenSegmentSegment.bottom_right).should be_false
        char.has_segment?(SevenSegmentSegment.bottom).should be_false
      end

      it "can be initialized with a string (8)" do
        input_string = \
          " x "\
          "x x"\
          " x "\
          "x x"\
          " x "
        char = SevenSegmentCharacter.initialize_from_string(input_string)

        char.has_segment?(SevenSegmentSegment.top).should be_true
        char.has_segment?(SevenSegmentSegment.top_left).should be_true
        char.has_segment?(SevenSegmentSegment.top_right).should be_true
        char.has_segment?(SevenSegmentSegment.middle).should be_true
        char.has_segment?(SevenSegmentSegment.bottom_left).should be_true
        char.has_segment?(SevenSegmentSegment.bottom_right).should be_true
        char.has_segment?(SevenSegmentSegment.bottom).should be_true
      end
    end
  end

  describe "has_segment?" do
    it "returns false for nil" do
      SevenSegmentCharacter.new.has_segment?(nil).should be_false
    end

    it "returns false if segments does not contain the segment" do
      segment = :target_segment
      character = SevenSegmentCharacter.new
      character.has_segment?(segment).should be_false
    end

    it "returns true if segments contains the segment" do
      segment = :target_segment
      character = SevenSegmentCharacter.new([segment])
      character.has_segment?(segment).should be_true
    end
  end
end
