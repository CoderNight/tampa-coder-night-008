require_relative 'numbers'

class Gpu
  include Numbers

  attr_reader   :number, :output, :size
  attr_accessor :numbers_array, :input_as_array

  def initialize(num, size)
    @number        = num
    @size          = size ||= 2
    @numbers_array = numbers_array
  end

  # Get the array representation of the number
  #
  # @param [Fixnum] number to fetch array version.
  # @return [Array] representation of number.
  def get_number(int)
    num_lookup = { 0 => zero, 1 => one, 2 => two,   3 => three, 4 => four,
                   5 => five, 6 => six, 7 => seven, 8 => eight, 9 => nine }
    num_lookup.fetch(int)
  end

  # Split the input string into an Array of numbers
  #
  # @return [Array] of numbers
  def input_as_array
    array = number.split('')

    return array.collect! { |x| x.to_i }
  end

  # Array of arrays representing the lcd numbers
  # Creates an array of arrays that represents
  # the numbers to be displayed.
  #
  # @return [Array] of arrays that represent the numbers
  def numbers_array
    num_array = Array.new
    input_as_array.each { |n| num_array << get_number(n) }

    return num_array
  end

  # Merge all of the number arrays into a single array to display
  #
  # @param [Array] Multidimensional Array of Numbers
  # @return [Array]
  def combined_array(multid_array)
    new_array = Array.new(multid_array.first.count) { |x| Array.new }

    multid_array.each do |array|
      array.each_index do |index|
        new_array[index] = new_array[index] + array[index]
      end
    end

    return new_array
  end

  # ** This method is not complete. **
  #
  # Adjust the size of the numbers based on the value passed.
  def adjust_number(initial_array)
    initial_array.each do |array|
      if array.include? "-"
        insert_at = array.rindex("-")
        size.times { array.insert insert_at, "-" } #add - to rows
        next
      elsif array.include? "|"
        size.times { array.insert 1, " " } # insert number of blanks after the pipe
        # add copies of the array to grow number vertically
        #size.times do
        # array_copy = Array.new(array)
        #end
      elsif array.all? { |x| x == " " }
        insert_at  = array.first
        size.times { array.insert insert_at, " " } # add additional space to blank lines
        next
      end
    end
  end

  # Prints out the final numbers
  #
  # @param [Array] of numbers to print out
  # @return [String] output
  def printable_display(numbers)
    numbers.each { |i| puts i.join('') }
  end

  # Main console output of the LCD numbers
  def output
    printable_display combined_array(numbers_array)
  end
end
