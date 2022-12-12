
def read_towers(data)
  towers = []

  data
    .split("\n")
    .map { |line| line.split(/\s{4}|\s/) }
    .reverse
    .each_with_index do |level, i|
      next if i == 0

      level
        .map {|el| el.gsub(/\[|\]/, '') }
        .each_with_index do |el, j|
        next if el == ''

        towers[j] = [] if towers[j].nil?
        towers[j] << el
      end
    end

  towers
end

def read_instructions(data)
  data
    .split("\n")
    .map { |line| /move (?<n>\d+) from (?<from>\d+) to (?<to>\d+)/.match(line) }
    .map { |m| [m[:n].to_i, m[:from].to_i, m[:to].to_i] }
end

def move(towers, n, from, to)
  # part 1 n.times { towers[to-1] << towers[from-1].pop }
  towers[to-1] += towers[from-1].pop(n)
end

def move_all(towers, instructions)
  instructions.each do |n, from, to|
    move(towers, n, from, to)
  end
end

if ARGV.empty?
  require 'rspec/autorun'
  RSpec.describe 'Day 5' do
    before(:all) do
      @towers, @instructions = DATA.read.split("\n\n")
    end

    it 'moves elements' do
      towers = read_towers(@towers)
      instructions = read_instructions(@instructions)
      move(towers, 1, 2, 1)
      expect(towers[0]).to eq(['Z', 'N', 'D'])
      expect(towers[1]).to eq(['M', 'C'])
      expect(towers[2]).to eq(['P'])
    end

    it 'works for the full test case' do
      towers = read_towers(@towers)
      instructions = read_instructions(@instructions)
      move_all(towers, instructions)
      expect(towers[0]).to eq(['C'])
      expect(towers[1]).to eq(['M'])
      expect(towers[2]).to eq(['P', 'D', 'N', 'Z'])
    end

    it 'reads the towers as expected' do
      towers = read_towers(@towers)
      expect(towers.length).to eq(3), towers
      expect(towers.first.length).to eq(2)
      expect(towers[0][0]).to eq('Z'), towers
      expect(towers[0][1]).to eq('N')
    end

    it 'reads the instructions' do
      instructions = read_instructions(@instructions)
      expect(instructions.length).to eq(4), instructions
      expect(instructions).to eq([
        [1, 2, 1],
        [3, 1, 3],
        [2, 2, 1],
        [1, 1, 2],
      ])
    end
  end
else
  towers, instructions = File.read(ARGV[0]).split("\n\n")
  towers = read_towers(towers)
  instructions = read_instructions(instructions)
  move_all(towers, instructions)
  puts towers.map(&:last).join
end

__END__
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
