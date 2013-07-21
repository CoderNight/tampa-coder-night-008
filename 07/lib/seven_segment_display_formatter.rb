require_relative 'seven_segment_character_factory.rb'
require_relative 'seven_segment_cell.rb'

class SevenSegmentDisplayFormatter
  def initialize(seven_segment_character_factory = SevenSegmentCharacterFactory.new)
    @seven_segment_character_factory = seven_segment_character_factory
  end

  def format(input_string, multiplier)
    characters = @seven_segment_character_factory.get_characters(input_string)
    cells = characters.map do |char|
      SevenSegmentCell.new(char)
    end

    (0...SevenSegmentCell.cell_rows).inject("") do |output, row|
      output << (get_line(cells, row, multiplier) + "\n") * multiplier_for_row(row, multiplier)
    end
  end

private
  def get_line(cells, row, multiplier)
    cells.inject("") do |line_output, cell|
      line_output << " " unless line_output.empty?
      line_output << get_cell_row(cell, row, multiplier)
    end
  end

  def get_cell_row(cell, row, multiplier)
    (0...SevenSegmentCell.cell_columns).inject("") do |cell_output, column|
      cell_output << cell.character_at_index(column, row) * multiplier_for_column(column, multiplier)
    end
  end

  def use_multiplier_for_column(column)
    column == 1
  end

  def multiplier_for_column(column, multiplier)
    use_multiplier_for_column(column) ? multiplier : 1
  end

  def multiplier_for_row(row, multiplier)
    use_multiplier_for_row(row) ? multiplier : 1
  end

  def use_multiplier_for_row(row)
    (row == 1) || (row == 3)
  end
end
