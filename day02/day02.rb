#require "rspec/autorun"

def result(them, me)
  me.ord - 87
end

def bonus(them, me)
  case [them, me]
  in ["A", "Z"] | ["B", "X"] | ["C", "Y"]
    0
  in ["A", "X"] | ["B", "Y"] | ["C", "Z"]
    3
  else
    6
  end
end

def total(them, me)
  result(them, me) + bonus(them, me)
end

def transform(them, outcome)
  case [them, outcome]
  in ["A", "Y"] | ["B", "X"] | ["C", "Z"]
    "X"
  in ["A", "Z"] | ["B", "Y"] | ["C", "X"]
    "Y"
  else
    "Z"
  end
end

def total2(them, outcome)
  me = transform(them, outcome)

  result(them, me) + bonus(them, me)
end

# RSpec.describe "RPS" do
#   [
#     ["A", "Y", 4],
#     ["B", "X", 1],
#     ["C", "Z", 7],
#   ].each do |them, me, _total|
#     it "calculates the second score #{them}, #{me}" do
#       expect(total2(them, me)).to eq(_total)
#     end
#   end

#   [
#     ["A", "Y", 2, 6, 8],
#     ["B", "X", 1, 0, 1],
#     ["C", "Z", 3, 3, 6]
#   ].each do |them, me, _result, _bonus, _total|
#     it "calculates the score #{them}, #{me}" do
#       expect(result(them, me)).to eq(_result)
#       expect(bonus(them, me)).to eq(_bonus)
#       expect(total(them, me)).to eq(_total)
#     end
#   end
# end

#data = DATA.readlines
data = File.readlines(ARGV.first)

p data
  .map(&:chomp)
  .map { _1.split(" ") }
  .map { total(_1, _2) }
  .sum

p data
  .map(&:chomp)
  .map { _1.split(" ") }
  .map { total2(_1, _2) }
  .sum

__END__
A Y
B X
C Z
