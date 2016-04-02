# https://codeiq.jp/challenge/2769
# load './billiad.rb'

# 最大公約数 ユークリッドの互除法による
def gcd(m, n)
  if m < n
    gcd(n, m)
  elsif m % n == 0
    n
  else
    gcd(n, m % n)
  end
end

# 最小の場合の道のり
def route_min(m, n)
  # g = gcd(m, n)
  # if g == 1
  #   m * n
  # else
  #  # 道のりの形を保ったまま縮小 * マス目の数
  #  g * route_min(m / g, n / g)

  # ところで、ここで両者を"最大"公約数で徐算しているため
  # 上記のelse文は最大1度しか実行されない
  # これを踏まえると以下の通り簡単にできる

  m * n / gcd(m, n)
end

def route_max(m, n)
  if m < n
    route_max(n, m)
  elsif m % n == 0
    # 長い方の辺の往復
    m * 2
  else
    # 全てのマスを通る
    m * n
  end
end

if __FILE__ == $0
  input = STDIN.gets.split(',')
  m = input[0].to_i
  n = input[1].to_i

  puts route_min(m, n)
  puts route_max(m, n)

end
