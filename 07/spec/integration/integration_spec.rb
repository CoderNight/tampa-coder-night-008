require_relative '../spec_helper.rb'

describe "The Seven Segment Display Formatter (Integration)" do

  subject(:seven_segment_display_formatter) { SevenSegmentDisplayFormatter.new }

  it "outputs the correct string for 012345 (multiplier = 2)" do
    expected_output = \
" --        --   --        -- \n"\
"|  |    |    |    | |  | |   \n"\
"|  |    |    |    | |  | |   \n"\
"           --   --   --   -- \n"\
"|  |    | |       |    |    |\n"\
"|  |    | |       |    |    |\n"\
" --        --   --        -- \n"
    seven_segment_display_formatter.format("012345", 2).should == expected_output
  end

  it "outputs the correct string for 6789 (multiplier = 1)" do
    expected_output = \
" -   -   -   - \n"\
"|     | | | | |\n"\
" -       -   - \n"\
"| |   | | |   |\n"\
" -       -   - \n"
    seven_segment_display_formatter.format("6789", 1).should == expected_output
  end

end
