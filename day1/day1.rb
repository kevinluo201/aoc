# part1
max = 0
tmp = 0
File.readlines('input').each do |line|
  if line != "\n"
    tmp += line.to_i
  else
    max = tmp if tmp > max
    tmp = 0
  end
end
puts max

# part2
top3 = [0, 0, 0]
tmp = 0
File.readlines('input').each do |line|
  if line != "\n"
    tmp += line.to_i
  else
    if tmp > top3[2]
      top3[2] = tmp
      top3.sort!.reverse!
    end
    tmp = 0
  end
end
puts top3.sum
