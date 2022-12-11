#data = DATA.readlines
data = File.readlines(ARGV.first)

p data
  .map(&:chomp)
  .chunk_while { _2 != "" }
  .map { _1.map(&:to_i) }
  .map(&:sum)
  .max

p data
  .map(&:chomp)
  .chunk_while { _2 != ""}
  .map { _1.map(&:to_i) }
  .map(&:sum)
  .sort[-3..]
  .sum

__END__
1000
2000
3000

4000

5000
6000

7000
8000
9000

10000