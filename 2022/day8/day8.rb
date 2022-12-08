grid = []
File.readlines('input').each do |line|
  break if line == "\n"
  grid << line.chomp.split('').map(&:to_i)
end
grid_t = grid.transpose

# part1
ans = grid.length * 4 - 4
(1..grid.length - 2).each do |i|
  (1..grid.length - 2).each do |j|
    left = grid[i][0..j - 1].all? { |t| t < grid[i][j] }
    right = grid[i][j + 1..-1].all? { |t| t < grid[i][j] }
    up = grid_t[j][0..i - 1].all? { |t| t < grid[i][j] }
    down = grid_t[j][i + 1..-1].all? { |t| t < grid[i][j] }
    ans += 1 if left || right || up || down
  end
end
puts ans

# part2
ans = 1
(1..grid.length - 2).each do |i|
  (1..grid.length - 2).each do |j|
    left = grid[i][0..j - 1].reverse.find_index { |t| t >= grid[i][j] }
    left = left ? left + 1 : grid[i][0..j - 1].length
    right = grid[i][j + 1..-1].find_index { |t| t >= grid[i][j] }
    right = right ? right + 1 : grid[i][j + 1..-1].length
    up = grid_t[j][0..i - 1].reverse.find_index { |t| t >= grid[i][j] }
    up = up ? up + 1 : grid_t[j][0..i - 1].length
    down = grid_t[j][i + 1..-1].find_index { |t| t >= grid[i][j] }
    down = down ? down + 1 : grid_t[j][i + 1..-1].length

    tmp = left * right * up * down
    ans = tmp if tmp > ans
  end
end
puts ans


