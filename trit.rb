# https://codeiq.jp/challenge/2758

def conv3_iter(n, m_l)
  if n < 3
    m_l << n
    m_l.reverse
  else
    m_l << n % 3
    conv3_iter(n / 3, m_l)
  end
end

def conv3(n)
  conv3_iter(n, [])
end

### ここから上は検証用のため解答に未使用 ###

# 数字が0, 1のみで構成される場合、3と3T表記は等しくなり、
# かつその時に限る
#
# 証明: a(n) \in {0, 1, 2}, b(n) \in {-1, 0, 1}とすると定義より
# a(n)a(n-1)…a(1)a(0) [3] = \Sum_{i=0}^{n} a(i) * 3^i
# b(n)b(n-1)…b(1)b(0) [3T] = \Sum_{i=0}^{n} b(i) * 3^i
#
# ここで、a(n)から{2}, b(n)から{-1}を引くと両者とも {0, 1}となり等しくなる
# また、3進数の表記法は一意に定まるため、これ以外はない

def reject2(n)
  # nが3進数表記で2を含む場合false
  # それ以外の場合trueを返す
  if n < 3
    return false if n == 2
    true
  else
    return false if n % 3 == 2
    reject2(n / 3)
  end
end

if __FILE__ == $0
  n = STDIN.gets.to_i
  # 0からnまでの数字で条件に合うものを計上
  ans = (0..n).select { |num| reject2(num) }.size
  puts ans
end
