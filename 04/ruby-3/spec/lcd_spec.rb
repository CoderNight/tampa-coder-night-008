LCD=["- -- -----",
     ["|   ||| ||", "|||||  |||"],
     "  ----- --",
     ["| |   | | ", "|| |||||||"],
     "- -- -- --"]

def lcd(str, size)
  [ str.chars.map(&:to_i).map { |n|
    " " + LCD[0][n]*size + " "
  }.join ] + 

  [ str.chars.map(&:to_i).map { |n|
    LCD[1][0][n] + " "*size + LCD[1][1][n]
  }.join ]*size +

  [ str.chars.map(&:to_i).map { |n|
    " " + LCD[2][n]*size + " "
  }.join ] +

  [ str.chars.map(&:to_i).map { |n|
    LCD[3][0][n] + " "*size + LCD[3][1][n]
  }.join ]*size +

  [ str.chars.map(&:to_i).map { |n|
    " " + LCD[4][n]*size + " "
  }.join ]
end

describe "lcd" do
  it "should work" do
    puts lcd("0123456789", 1)
    puts lcd("0123456789", 2)
    puts lcd("0123456789", 3)
  end
end
