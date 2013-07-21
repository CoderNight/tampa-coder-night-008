require_relative '../spec_helper.rb'

describe "The Seven Segment Display Formatter" do

  describe "instantiation" do
    it "can be instantiated (no args)" do
      SevenSegmentDisplayFormatter.new.should_not be_nil
    end

    it "can be instantiated with a SevenSegmentCharacterFactory" do
      seven_segment_character_factory = :seven_segment_character_factory
      SevenSegmentDisplayFormatter.new(seven_segment_character_factory).should_not be_nil
    end
  end

  # TODO: these tests smell like they're testing this specific implementation
  describe "formatting" do
    let (:seven_segment_character_factory) { double("char_factory") }
    let (:seven_segment_display_formatter) { SevenSegmentDisplayFormatter.new(seven_segment_character_factory) }
    let (:input_string) { :input_string }
    let (:multiplier) { 1 }
    let (:doesnt_matter_char) { double(:character_at_index => "") }

    it "gets SevenSegmentCharacters from its SevenSegmentCharacterFactory " do
      ret_ssd_chars = []
      seven_segment_character_factory.should_receive(:get_characters).with(input_string).and_return(ret_ssd_chars)

      seven_segment_display_formatter.format(input_string, multiplier)
    end

    it "creates SevenSegmentCells for each character" do
      ret_ssd_chars = [ :char_1, :char_2, :char_3 ]
      seven_segment_character_factory.stub(:get_characters).with(input_string).and_return(ret_ssd_chars)

      ret_ssd_chars.each do |char|
        SevenSegmentCell.should_receive(:new).with(char).and_return(doesnt_matter_char)
      end

      seven_segment_display_formatter.format(input_string, multiplier)
    end

    it "generates output using character_at_location(x,y) for each point in a single cell" do
      expected_output = \
"1_2_3_\n"\
"4_5_6_\n"\
"7_8_9_\n"\
"10_11_12_\n"\
"13_14_15_\n"

      ret_ssd_chars = [ :char_1 ]
      seven_segment_character_factory.stub(:get_characters).with(input_string).and_return(ret_ssd_chars)

      ret_cell = double("cell")
      SevenSegmentCell.stub(:new).with(:char_1).and_return(ret_cell)

      counter = 0
      (0...SevenSegmentCell.cell_rows).each do |y|
        (0...SevenSegmentCell.cell_columns).each do |x|
          ret_cell.should_receive(:character_at_index).with(x,y).and_return("#{counter += 1}_")
        end
      end

      seven_segment_display_formatter.format(input_string, multiplier).should == expected_output
    end

    it "generates output using character_at_location(x,y) for each point in a multiple cell" do
      expected_output = \
"1_2_3_ 4_5_6_\n"\
"7_8_9_ 10_11_12_\n"\
"13_14_15_ 16_17_18_\n"\
"19_20_21_ 22_23_24_\n"\
"25_26_27_ 28_29_30_\n"

      ret_ssd_chars = [ :char_1, :char_2 ]
      seven_segment_character_factory.stub(:get_characters).with(input_string).and_return(ret_ssd_chars)

      ret_cell_1 = double("cell")
      SevenSegmentCell.stub(:new).with(:char_1).and_return(ret_cell_1)

      ret_cell_2 = double("cell")
      SevenSegmentCell.stub(:new).with(:char_2).and_return(ret_cell_2)

      counter = 0
      (0...SevenSegmentCell.cell_rows).each do |y|
        [ret_cell_1, ret_cell_2].each do |ret_cell|
          (0...SevenSegmentCell.cell_columns).each do |x|
            ret_cell.should_receive(:character_at_index).with(x,y).and_return("#{counter += 1}_")
          end
        end
      end

      seven_segment_display_formatter.format(input_string, multiplier).should == expected_output
    end

    it "generates output using character_at_location(x,y) for each point in a single cell (with a multiplier)" do
      expected_output = \
"1_2_2_3_\n"\
"4_5_5_6_\n"\
"4_5_5_6_\n"\
"7_8_8_9_\n"\
"10_11_11_12_\n"\
"10_11_11_12_\n"\
"13_14_14_15_\n"
      multiplier = 2

      ret_ssd_chars = [ :char_1 ]
      seven_segment_character_factory.stub(:get_characters).with(input_string).and_return(ret_ssd_chars)

      ret_cell = double("cell")
      SevenSegmentCell.stub(:new).with(:char_1).and_return(ret_cell)

      (0...SevenSegmentCell.cell_rows).each do |y|
        (0...SevenSegmentCell.cell_columns).each do |x|
          ret_cell.stub(:character_at_index).with(x,y).and_return("#{1 + x + (y * SevenSegmentCell.cell_columns)}_")
        end
      end

      seven_segment_display_formatter.format(input_string, multiplier).should == expected_output
    end
  end
end
