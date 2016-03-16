# input from standard input
# split by line

if __FILE__ == $0
  lines = []
  STDIN.each_line do |line|
    break if line == "\n"
    lines << line.delete("\n").split(",")
  end

  char = lines[0][0]

  print char * 18
end
