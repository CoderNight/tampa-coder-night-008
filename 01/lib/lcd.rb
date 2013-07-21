module LCD
  DEFAULT_SIZE = 2

  def self.render(input, opts={size: DEFAULT_SIZE})
    digits = input.split('').map { |digit| Digit.new(digit) }

    rendered_digits = digits.reduce([]) { |rendered, digit|
      rendered << digit.render(opts)
    }

    lines = rendered_digits.transpose.map { |cols| cols.join(Digit::SPACER) }.flatten
    lines.join("\n")
  end

  class Digit
    POSITIONS = {
      '0' => [:top, :top_left, :top_right, :bottom, :bottom_left, :bottom_right],
      '1' => [:top_right, :bottom_right],
      '2' => [:top, :top_right, :middle, :bottom, :bottom_left],
      '3' => [:top, :top_right, :middle, :bottom, :bottom_right],
      '4' => [:top_left, :top_right, :middle, :bottom_right],
      '5' => [:top, :top_left, :middle, :bottom, :bottom_right],
      '6' => [:top, :top_left, :middle, :bottom, :bottom_left, :bottom_right],
      '7' => [:top, :top_right, :bottom_right],
      '8' => [:top, :top_left, :top_right, :middle, :bottom, :bottom_left, :bottom_right],
      '9' => [:top, :top_left, :top_right, :middle, :bottom_right]
    }

    GRID_ROWS = [
      [:top],
      [:top_left, :top_right],
      [:middle],
      [:bottom_left, :bottom_right],
      [:bottom]
    ]

    SPACER         = ' '
    VERTICAL_BAR   = '|'
    HORIZONTAL_BAR = '-'

    CHARS = {
      top:           HORIZONTAL_BAR,
      middle:        HORIZONTAL_BAR,
      bottom:        HORIZONTAL_BAR,
      top_left:      VERTICAL_BAR,
      top_right:     VERTICAL_BAR,
      bottom_left:   VERTICAL_BAR,
      bottom_right:  VERTICAL_BAR
    }

    attr :digit, :positions

    def initialize(digit)
      @digit = digit
      @positions = POSITIONS[digit]
    end

    def render(opts={size: DEFAULT_SIZE})
      @lines ||= GRID_ROWS.reduce([]) { |lines, row|
        if GRID_ROWS.index(row) % 2 == 0
          lines << render_line(row & positions, opts)
        else
          opts[:size].times do
            lines << render_line(row & positions, opts)
          end
        end
        lines
      }
    end

    def render_line(positions, opts={size: DEFAULT_SIZE})
      left = CHARS[([:top_left, :bottom_left] & positions)[0]] || SPACER
      middle = CHARS[([:top, :middle, :bottom] & positions)[0]] || SPACER
      right = CHARS[([:top_right, :bottom_right] & positions)[0]] || SPACER

      line = left
      opts[:size].times do
        line += middle
      end
      line += right
      line
    end
  end
end
