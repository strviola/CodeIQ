# https://codeiq.jp/challenge/2349

def f(x, i)
  return i if x == 1
  return f(x / 2, i + 1) if x % 2 == 0
  return f(x - 1, i + 1) if x % 2 == 1
end

if __FILE__ == $0
  puts f(STDIN.gets.to_i, 0)
end
