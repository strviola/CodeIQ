# count up designated integer
# https://codeiq.jp/challenge/1630

# def count7(num)
#   num.to_s.chars.select { |c| c == '7' }.size
# end

# 桁の最小整数 t10(2) => 10
def t10(t)
  10 ** (t - 1)
end

# nのt桁目の数値 digit(98765, 3) => 7
def digit(n, t)
  (n / t10(t)) % 10
end

# nまでの整数のうちt桁目が7であるものを返す
def count_digit7(n, t)
  if digit(n, t) == 7 && t > 1
    # t桁目が7である場合
    # t桁目を1減らした数までの個数を計算し
    # t-1桁目以下の整数+1を足す
    count_digit7(n - t10(t), t) + n % t10(t) + 1
  else
    # それ以外の場合、n + 3 / 10 を各桁に行う
    ((3 * t10(t) + n) / t10(t + 1)) * t10(t)
  end
end

if __FILE__ == $0
  n_a = []
  STDIN.each_line do |n_s|
    n_a << n_s.to_i
  end
  n_a.each do |n|
    t = 1
    ans = 0
    while n > t10(t - 1)
      ans += count_digit7(n, t)
      t += 1
    end
    # 解答出力
    puts ans
  end
end
