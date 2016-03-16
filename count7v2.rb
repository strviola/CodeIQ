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
    position = 1
    while num_range > 1
      puts "count: #{count_of_7}, num: #{num_range}"
      num_range = (num_range + 3) / 10
      count_of_7 += num_range * position
      position *= 10
    end

    puts count_of_7
  end
end
