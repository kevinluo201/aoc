# part 1
stacks = [
  ['Q', ' ', ' ', 'N', ' ', ' ', ' ', 'N', ' '],
  ['H', ' ', 'B', 'D', ' ', ' ', ' ', 'S', 'M'],
  ['C', ' ', 'Q', 'J', ' ', ' ', 'V', 'Q', 'D'],
  ['T', ' ', 'S', 'Z', 'F', ' ', 'J', 'J', 'W'],
  ['N', 'G', 'T', 'S', 'V', ' ', 'B', 'C', 'C'],
  ['S', 'B', 'R', 'W', 'D', 'J', 'Q', 'R', 'Q'],
  ['V', 'D', 'W', 'G', 'P', 'W', 'N', 'T', 'S'],
  ['B', 'W', 'F', 'L', 'M', 'F', 'L', 'G', 'J']
].transpose.map { |row| row.map { |r| r == ' '? nil : r }.compact.reverse }

File.readlines('input').each do |line|
  break if line == "\n"
  match = /move (\d+) from (\d+) to (\d+)/.match(line)
  move = match[1].to_i
  from = match[2].to_i
  to = match[3].to_i
  stacks[to - 1] += stacks[from - 1].pop(move).reverse
end
puts stacks.map { |stack| stack[-1] }.compact.join

# part 2
stacks = [
  ['Q', ' ', ' ', 'N', ' ', ' ', ' ', 'N', ' '],
  ['H', ' ', 'B', 'D', ' ', ' ', ' ', 'S', 'M'],
  ['C', ' ', 'Q', 'J', ' ', ' ', 'V', 'Q', 'D'],
  ['T', ' ', 'S', 'Z', 'F', ' ', 'J', 'J', 'W'],
  ['N', 'G', 'T', 'S', 'V', ' ', 'B', 'C', 'C'],
  ['S', 'B', 'R', 'W', 'D', 'J', 'Q', 'R', 'Q'],
  ['V', 'D', 'W', 'G', 'P', 'W', 'N', 'T', 'S'],
  ['B', 'W', 'F', 'L', 'M', 'F', 'L', 'G', 'J']
].transpose.map { |row| row.map { |r| r == ' '? nil : r }.compact.reverse }

File.readlines('input').each do |line|
  break if line == "\n"
  match = /move (\d+) from (\d+) to (\d+)/.match(line)
  move = match[1].to_i
  from = match[2].to_i
  to = match[3].to_i
  stacks[to - 1] += stacks[from - 1].pop(move)
end
puts stacks.map { |stack| stack[-1] }.compact.join