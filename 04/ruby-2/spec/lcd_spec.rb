LCD=["- -- -----",
     ["|   ||| ||", "|||||  |||"],
     "  ----- --",
     ["| |   | | ", "|| |||||||"],
     "- -- -- --"]

def lcd(str, size)
  [0,2,4].map {|row| str.chars.map(&:to_i).map { |n| " " + LCD[row][n]*size + "  " }.join }.zip(
  [1,3].map {|row| (1..size).map { str.chars.map(&:to_i).map { |n| LCD[row][0][n] + " "*size + LCD[row][1][n] + " "}.join } }).join("\n")
end

describe "lcd" do
  it "should work" do
    puts lcd("0123456789", 1)
    puts lcd("0123456789", 2)
    puts lcd("0123456789", 3)
  end
end
