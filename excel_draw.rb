# input from standard input
# split by line

if __FILE__ == $0
  lines = []
  STDIN.each_line do |line|
    break if line == "\n"
    lines << line.delete("\n").split(",")
  end

  n = lines[0][0].to_i
  m = lines[0][1].to_i

  puts n + m - 1
end
