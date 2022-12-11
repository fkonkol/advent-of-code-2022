data = DATA.readlines
#data = File.readlines(ARGV.first)

p data
    .map(&:chomp)
    .map(&:chars)
    .map { _1.each_slice(_1.length / 2).to_a }
    .map { |left, right| left & right }
    .flatten
    .map { _1 =~ /[A-Z]/ ? _1.ord - 38 : _1.ord - 96 }
    .sum

p data
    .map(&:chomp)
    .each_slice(3)
    .map { _1.map(&:chars) }
    .map { _1 & _2 & _3 }
    .flatten
    .map { _1 =~ /[A-Z]/ ? _1.ord - 38 : _1.ord - 96 }
    .sum

__END__
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
