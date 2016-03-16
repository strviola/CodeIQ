# count up prime numbers
# https://codeiq.jp/node/1598

def prime?(num)
  if num == 2
    return true
  elsif num < 1
    return false
  else
    return (2 ** (num - 1)) % num == 1
  end
end

if __FILE__ == $0
  lines = []

  STDIN.each_line do |line|
    lines << line.delete("\n")
  end

  lines.each do |line|
    num_max = line.to_i
    prime_count = 0

    2.upto(num_max).each do |i|
      if prime?(i)
        prime_count += 1
      end
    end

    puts prime_count
  end
end
