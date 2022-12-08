class Directory
  attr_accessor :name, :parent, :subdirectories, :files

  def initialize(name, parent = nil)
    @name = name
    @parent = parent
    @subdirectories = {}
    @files = {}
  end

  def read(line)
    a, b = line.split(' ')
    if a == 'dir'
      @subdirectories[b] ||= Directory.new(b, self)
    else
      @files[b] = a.to_i
    end
  end

  def total_size
    subdirectories.values.map(&:total_size).sum + files.values.sum
  end

  def traverse
    [self, subdirectories.values.map(&:traverse)].flatten
  end
end

# read the input
root = Directory.new('/')
current_dir = root
File.open('input', 'r') do |file|
  # skip the first line
  file.readline

  loop do
    break if file.eof?
    line = file.readline.chomp

    if line.start_with?('$')
      _, cmd, arg = line.split(' ')
      if cmd == 'cd'
        if arg == '..'
          current_dir = current_dir.parent
        else
          current_dir = current_dir.subdirectories[arg]
        end
      end
    else
      current_dir.read(line)
    end
  end
end

# part1
ans = root.traverse.reduce(0) do |sum, dir|
  size = dir.total_size
  sum += size if size <= 100_000
  sum
end
puts ans

# part2
puts root.traverse.map(&:total_size).select { |size| size >= root.total_size - 40_000_000 }.min

