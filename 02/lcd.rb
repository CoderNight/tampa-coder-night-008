# https://gist.github.com/ambethia/5960316

def command_line_run
  number_to_parse = ''
  repeater = 2

  # extract command line arguments
  s_flag = 0
  ARGV.each do |a|
    if a == '-s'
      s_flag = 1
    else
      if s_flag == 1
        repeater = a
        s_flag = 0
      else
        number_to_parse = a
      end
    end
  end

  WriteLine.new.odd_line(number_to_parse, repeater, [1,4])
  WriteLine.new.even_line(number_to_parse, repeater, [5,6], [1,2,3,7])
  WriteLine.new.odd_line(number_to_parse, repeater, [0,1,7])
  WriteLine.new.even_line(number_to_parse, repeater, [2], [1,3,4,5,7,9])
  WriteLine.new.odd_line(number_to_parse, repeater, [1,4,7])
end


class WriteLine
  def odd_line (x, r, blank_array)
    output = ''
    x.split('').each do |i|
      output += ' '
      ( blank_array.include?(i.to_i) ) ? output += blanks(r) : output += dashes(r)
      output += '  '
    end
    puts output
  end

  def even_line(x, r, left_pipe_only, right_pipe_only)
    (1..r.to_i).each do
      output = ''
      x.split('').each do |i|
        if left_pipe_only.include?(i.to_i)
          output += '|' + blanks(r) + ' '
        else
          ( right_pipe_only.include?(i.to_i) ) ? output += ' ' + blanks(r) + '|' : output += '|' + blanks(r) + '|'
        end
        output += ' '
      end
      puts output
    end
  end


  def blanks(r)
    output = ''
    (1..r.to_i).each { output += ' ' }
    output
  end

  def dashes(r)
    output = ''
    (1..r.to_i).each { output += '-' }
    output
  end
end

command_line_run