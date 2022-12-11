require "set"

if ARGV.empty?
  data = DATA.readlines
else
  data = File.readlines(ARGV.first)
end

d =
  data
    .map(&:chomp)
    .map { _1.split(/[,-]/) }
    .map { _1.map(&:to_i) }
    .map { _1.each_slice(2).to_a }
    .map { _1.map { |a, b| (a..b).to_set } }

res1 =
  d.reduce(0) do |count, (a, b)|
    a.subset?(b) || b.subset?(a) ? count + 1 : count
  end

res2 =
  d.reduce(0) do |count, (a, b)|
    a.intersect?(b) || b.intersect?(a) ? count + 1 : count
  end

p res1, res2

__END__
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
