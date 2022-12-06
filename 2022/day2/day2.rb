table_i = {
  'A' => :rock,
  'B' => :paper,
  'C' => :scissors
}
table_j = {
  'X' => :rock,
  'Y' => :paper,
  'Z' => :scissors
}

# part1
points = 0
File.readlines('input').each do |line|
  break if line == "\n"
  i, j = line.split(' ')
  i = table_i[i]
  j = table_j[j]

  case i
  when :rock
    if j == :rock
      points += 4
    elsif j == :paper
      points += 8
    else
      points += 3
    end
  when :paper
    if j == :rock
      points += 1
    elsif j == :paper
      points += 5
    else
      points += 9
    end
  when :scissors
    if j == :rock
      points += 7
    elsif j == :paper
      points += 2
    else
      points += 6
    end
  end
end
puts points

# part2
table_j = {
  'X' => :lose,
  'Y' => :draw,
  'Z' => :win
}
points = 0
File.readlines('input').each do |line|
  break if line == "\n"
  i, j = line.split(' ')
  i = table_i[i]
  j = table_j[j]

  case j
  when :win then points += 6
  when :draw then points += 3
  end

  case i
  when :rock
    if j == :win
      points += 2
    elsif j == :draw
      points += 1
    else
      points += 3
    end
  when :paper
    if j == :win
      points += 3
    elsif j == :draw
      points += 2
    else
      points += 1
    end
  when :scissors
    if j == :win
      points += 1
    elsif j == :draw
      points += 3
    else
      points += 2
    end
  end
end
puts points