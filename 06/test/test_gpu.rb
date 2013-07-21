require_relative '../lib/gpu'
require          'test/unit'

class TestGpu < Test::Unit::TestCase
  def setup
    @gpu = Gpu.new('123', 1)
    @five_array =  [
      [' ','-',' '],
      ['|',' ',' '],
      [' ','-',' '],
      [' ',' ','|'],
      [' ','-',' ']
    ]
    @adjusted_array =  [
      [' ','-','-',' '],
      ['|',' ',' '],
      [' ','-','-',' '],
      [' ',' ','|'],
      [' ','-','-',' ']
    ]
    @multid_array = [
      [[" ", " ", " "],
       [" ", " ", "|"],
       [" ", " ", " "],
       [" ", " ", "|"],
       [" ", " ", " "]],
      [[" ", "-", " "],
       [" ", " ", "|"],
       [" ", "-", " "],
       ["|", " ", " "],
       [" ", "-", " "]],
      [[" ", "-", " "],
       [" ", " ", "|"],
       [" ", "-", " "],
       [" ", " ", "|"],
       [" ", "-", " "]]
    ]
    @display_array = [
      [" ", " ", " ", " ", "-", " ", " ", "-", " "],
      [" ", " ", "|", " ", " ", "|", " ", " ", "|"],
      [" ", " ", " ", " ", "-", " ", " ", "-", " "],
      [" ", " ", "|", "|", " ", " ", " ", " ", "|"],
      [" ", " ", " ", " ", "-", " ", " ", "-", " "]
    ]
  end

  def test_number
    assert_equal   "123",  @gpu.number
    assert_kind_of String, @gpu.number
  end

  def test_size
    assert_equal   1,      @gpu.size
    assert_kind_of Fixnum, @gpu.size
  end

  def test_get_number
    assert_equal   @five_array, @gpu.get_number(5)
    assert_kind_of Array,       @gpu.get_number(5)
  end

  def test_input_as_array
    assert_equal   [ 1 ,2, 3], @gpu.input_as_array
    assert_kind_of Array,      @gpu.input_as_array
    assert_kind_of Fixnum,     @gpu.input_as_array.first
  end

  def test_numbers_array
    assert_equal   @multid_array, @gpu.numbers_array
    assert_kind_of Array,         @gpu.numbers_array
  end

  def test_combined_array
    assert_equal   @display_array, @gpu.combined_array(@multid_array)
    assert_kind_of Array,          @gpu.combined_array(@multid_array)
  end

  #def test_adjust_number
  #end
end
