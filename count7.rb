# count up designated integer
# https://codeiq.jp/challenge/1630

def count7(num)
  num.to_s.chars.select { |c| c == '7' }.size
end

if __FILE__ == $0
  lines = []

  STDIN.each_line do |line|
    lines << line.delete("\n")
  end

  lines.each do |line|
    num_range = line.to_i
    if num_range == 1
      puts 0
      next
    end

    count_of_7 = 0
    1.upto(num_range).each do |i|
      count_of_7 += count7(i)
    end

    puts count_of_7
  end
end
