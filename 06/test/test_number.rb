require_relative '../lib/numbers'
require          'test/unit'

class TestNumbers
  include Numbers
end

class TestNumbersModule < Test::Unit::TestCase
  def setup
    @number = TestNumbers.new
  end

  def test_zero
    assert_equal(
      [
        [' ','-',' '],
        ['|',' ','|'],
        [' ',' ',' '],
        ['|',' ','|'],
        [' ','-',' ']
      ],
      @number.zero
    )
  end

  def test_one
    assert_equal(
      [
        [' ',' ',' '],
        [' ',' ','|'],
        [' ',' ',' '],
        [' ',' ','|'],
        [' ',' ',' ']
      ],
      @number.one
    )
  end

  def test_two
    assert_equal(
    [
      [' ','-',' '],
      [' ',' ','|'],
      [' ','-',' '],
      ['|',' ',' '],
      [' ','-',' ']
    ],
      @number.two
    )
  end

  def test_three
    assert_equal(
    [
      [' ','-',' '],
      [' ',' ','|'],
      [' ','-',' '],
      [' ',' ','|'],
      [' ','-',' ']
    ],
      @number.three
    )
  end

  def test_four
    assert_equal(
    [
      [' ',' ',' '],
      ['|',' ','|'],
      [' ','-',' '],
      [' ',' ','|'],
      [' ',' ',' ']
    ],
      @number.four
    )
  end

  def test_five
    assert_equal(
    [
      [' ','-',' '],
      ['|',' ',' '],
      [' ','-',' '],
      [' ',' ','|'],
      [' ','-',' ']
    ],
      @number.five
    )
  end

  def test_six
    assert_equal(
    [
      [' ','-',' '],
      ['|',' ',' '],
      [' ','-',' '],
      ['|',' ','|'],
      [' ','_',' ']
    ],
      @number.six
    )
  end

  def test_seven
    assert_equal(
    [
      [' ','-',' '],
      [' ',' ','|'],
      [' ',' ',' '],
      [' ',' ','|'],
      [' ',' ',' ']
    ],
      @number.seven
    )
  end

  def test_eight
    assert_equal(
    [
      [' ','-',' '],
      ['|',' ','|'],
      [' ','-',' '],
      ['|',' ','|'],
      [' ','-',' ']
    ],
      @number.eight
    )
  end

  def test_nine
    assert_equal(
    [
      [' ','-',' '],
      ['|',' ','|'],
      [' ','-',' '],
      [' ',' ','|'],
      [' ','-',' ']
    ],
      @number.nine
    )
  end
end
