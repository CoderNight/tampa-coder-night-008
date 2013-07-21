require_relative '../spec_helper.rb'

describe "Seven Segment Cells" do
  let (:seven_segment_character) { double("char", :has_segment? => false) }
  let (:cell) { SevenSegmentCell.new(seven_segment_character) }

  it "is instantiated with a SevenSegmentCharacter" do
    SevenSegmentCell.new(seven_segment_character).should_not be_nil
  end

  describe "character_at_index" do
    (0...SevenSegmentCell.cell_columns).each do |x|
      (0...SevenSegmentCell.cell_rows).each do |y|
        it "returns ' ' if the character does not have any segments (#{x}, #{y})" do
          seven_segment_character.stub(:has_segment?) { false }
          cell.character_at_index(x, y).should == " "
        end
      end
    end

    [
      { x: 1, y:0, segment: SevenSegmentSegment.top, character: "-"},
      { x: 0, y:1, segment: SevenSegmentSegment.top_left, character: "|"},
      { x: 2, y:1, segment: SevenSegmentSegment.top_right, character: "|"},
      { x: 1, y:2, segment: SevenSegmentSegment.middle, character: "-"},
      { x: 0, y:3, segment: SevenSegmentSegment.bottom_left, character: "|"},
      { x: 2, y:3, segment: SevenSegmentSegment.bottom_right, character: "|"},
      { x: 1, y:4, segment: SevenSegmentSegment.bottom, character: "-"}
    ].each do |ex|
      it "returns '#{ex[:character]}' for (#{ex[:x]},#{ex[:y]}) if the cell has #{ex[:segment]}" do
        seven_segment_character.stub(:has_segment?).with(ex[:segment]) { true }
        cell.character_at_index(ex[:x], ex[:y]).should == ex[:character]
      end
    end
  end
end
