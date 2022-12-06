table = {
  'a' => 1,
  'b' => 2,
  'c' => 3,
  'd' => 4,
  'e' => 5,
  'f' => 6,
  'g' => 7,
  'h' => 8,
  'i' => 9,
  'j' => 10,
  'k' => 11,
  'l' => 12,
  'm' => 13,
  'n' => 14,
  'o' => 15,
  'p' => 16,
  'q' => 17,
  'r' => 18,
  's' => 19,
  't' => 20,
  'u' => 21,
  'v' => 22,
  'w' => 23,
  'x' => 24,
  'y' => 25,
  'z' => 26,
  'A' => 27,
  'B' => 28,
  'C' => 29,
  'D' => 30,
  'E' => 31,
  'F' => 32,
  'G' => 33,
  'H' => 34,
  'I' => 35,
  'J' => 36,
  'K' => 37,
  'L' => 38,
  'M' => 39,
  'N' => 40,
  'O' => 41,
  'P' => 42,
  'Q' => 43,
  'R' => 44,
  'S' => 45,
  'T' => 46,
  'U' => 47,
  'V' => 48,
  'W' => 49,
  'X' => 50,
  'Y' => 51,
  'Z' => 52
}

# part 1
ans = 0
File.readlines('input').each do |line|
  break if line == "\n"
  a, b = line[0..line.length / 2 - 1], line[line.length / 2..-1]
  a.each_char do |c|
    if b.include?(c)
      ans += table[c]
      break
    end
  end
end
puts ans

# part 2
ans = 0
File.open('input', 'r') do |f|
  loop do
    group = []
    group << f.readline
    group << f.readline
    group << f.readline
    table.keys.each do |c|
      if group.all? { |l| l.include?(c) }
        ans += table[c]
      end
    end
    break if f.eof?
  end
end
puts ans