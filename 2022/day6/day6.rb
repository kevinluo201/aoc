# part1
i = 0
File.readlines('input').each do |line|
  break if line == "\n"
  loop do
    tmp = line[i..i+3]
    if (0..3).all? { |index| index == tmp.index(tmp[index]) }
      break
    else
      i += 1
    end
  end
end
puts i + 4

# part2
i = 0
File.readlines('input').each do |line|
  break if line == "\n"
  loop do
    tmp = line[i..i+13]
    if (0..13).all? { |index| index == tmp.index(tmp[index]) }
      break
    else
      i += 1
    end
  end
end
puts i + 14