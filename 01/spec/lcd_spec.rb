require './lib/lcd'
describe LCD do
  describe '.render' do
    it 'renders the correct output' do
      expected = " --        --   --        --   --   --   --   -- \n" \
                 "|  |    |    |    | |  | |    |       | |  | |  |\n" \
                 "|  |    |    |    | |  | |    |       | |  | |  |\n" \
                 "           --   --   --   --   --        --   -- \n" \
                 "|  |    | |       |    |    | |  |    | |  |    |\n" \
                 "|  |    | |       |    |    | |  |    | |  |    |\n" \
                 " --        --   --        --   --        --      "
      expect(LCD.render("0123456789")).to eq(expected)

      expected = " -       -   -       -   -   -   -   - \n" \
                 "| |   |   |   | | | |   |     | | | | |\n" \
                 "         -   -   -   -   -       -   - \n" \
                 "| |   | |     |   |   | | |   | | |   |\n" \
                 " -       -   -       -   -       -     "

      expect(LCD.render("0123456789", size: 1)).to eq(expected)
    end
  end

  describe LCD::Digit do
    Digit = LCD::Digit

    subject(:digit) { Digit.new('4') }

    describe '#render' do
      it {
        expected = ["   ",
                    "| |",
                    " - ",
                    "  |",
                    "   "]
        expect(digit.render(size: 1)).to eq(expected)
      }
    end

    describe '#render_line' do
      it {
        expect(digit.render_line([])).to                      eq('    ')
        expect(digit.render_line([:top_left, :top_right])).to eq('|  |')
        expect(digit.render_line([:middle])).to               eq(' -- ')
        expect(digit.render_line([:bottom_right])).to         eq('   |')
        expect(digit.render_line([])).to                      eq('    ')
      }
    end
  end
end
