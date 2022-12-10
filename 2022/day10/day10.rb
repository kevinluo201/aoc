# part1
x = 1
ans = 0
counter = 0
saving = nil
File.open('input', 'r') do |f|
  (1..220).each do |cycle|
    break if f.eof?

    if saving.nil?
      line = f.readline
      if line.start_with?('addx')
        saving = line.split(' ')[1].to_i
        counter = 2
      end
    end

    # during cycle
    if cycle == 20 || [60, 100, 140, 180, 220].include?(cycle)
      ans += x * cycle
      # p "cycle: #{cycle}, x: #{x}, ans: #{x * cycle}"
    end

    # end of cycle
    if counter > 0
      counter -= 1
      if counter == 0
        x += saving
        saving = nil
      end
    end
  end
end
puts ans

# part2
x = 1
ans = 0
counter = 0
saving = nil
File.open('input', 'r') do |f|
  (1..240).each do |cycle|
    break if f.eof?

    if saving.nil?
      line = f.readline
      if line.start_with?('addx')
        saving = line.split(' ')[1].to_i
        counter = 2
      end
    end

    # during cycle
    print (x..x + 2).include?(cycle % 40) ? '#' : '.'
    print "\n" if cycle % 40 == 0

    # end of cycle
    counter -= 1 if counter > 0
    if counter == 0 && !saving.nil?
      x += saving
      saving = nil
    end
  end
end
