# part 1
ans = 0
File.readlines('input').each do |line|
  break if line == "\n"
  a, b = line.split(',').map { |x| x.split('-').map(&:to_i) }
  if (a[0] <= b[0] && a[1] >= b[1]) || (a[0] >= b[0] && a[1] <= b[1])
    ans += 1
  end
end
puts ans

# part 2
ans = 0
File.readlines('input').each do |line|
  break if line == "\n"
  a, b = line.split(',').map { |x| x.split('-').map(&:to_i) }
  if (a[0] <= b[0] && a[1] >= b[1]) || (a[0] >= b[0] && a[1] <= b[1]) ||
     (a[0] >= b[0] && a[0] <= b[1]) || (a[1] >= b[0] && a[1] <= b[1])
    ans += 1
  end
end
puts ans