moving_map = {
  [-1, 2] => [1, -1],
  [0, 2] => [0, -1],
  [1, 2] => [-1, -1],
  [2, 1] => [-1, -1],
  [2, 0] => [-1, 0],
  [2, -1] => [-1, 1],
  [1, -2] => [-1, 1],
  [0, -2] => [0, 1],
  [-1, -2] => [1, 1],
  [-2, -1] => [1, 1],
  [-2, 0] => [1, 0],
  [-2, 1] => [1, -1]
}

# part1
head = [0, 0]
tail = [0, 0]
tail_history = [[0, 0]]
File.readlines('input').each do |line|
  break if line == "\n"
  direction, steps = line.chomp.split(' ')
  steps.to_i.times do
    case direction
    when 'U' then head[1] += 1
    when 'D' then head[1] -= 1
    when 'L' then head[0] -= 1
    when 'R' then head[0] += 1
    end

    relative_tail = [tail[0] - head[0], tail[1] - head[1]]
    if moving_map[relative_tail]
      tail[0] += moving_map[relative_tail][0]
      tail[1] += moving_map[relative_tail][1]
      tail_history << tail.dup
    end
  end
end
puts tail_history.uniq.count

# part2
# add diagonal moving
moving_map[[2, 2]] = [-1, -1]
moving_map[[2, -2]] = [-1, 1]
moving_map[[-2, -2]] = [1, 1]
moving_map[[-2, 2]] = [1, -1]
rope = 10.times.reduce([]) { |acc, i| acc << [0, 0]; acc }
tail_history = [[0, 0]]
File.readlines('input').each do |line|
  break if line == "\n"
  direction, steps = line.chomp.split(' ')
  steps.to_i.times do
    case direction
    when 'U' then rope[0][1] += 1
    when 'D' then rope[0][1] -= 1
    when 'L' then rope[0][0] -= 1
    when 'R' then rope[0][0] += 1
    end

    (1..9).each do |i|
      relative_knot = [rope[i][0] - rope[i - 1][0], rope[i][1] - rope[i - 1][1]]
      if moving_map[relative_knot]
        rope[i][0] += moving_map[relative_knot][0]
        rope[i][1] += moving_map[relative_knot][1]
        tail_history << rope[i].dup if i == 9
      end
    end
  end
end
puts tail_history.uniq.count