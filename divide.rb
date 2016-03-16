# https://codeiq.jp/challenge/2723

"""
def f(n)
  (1..n).inject(1, :*)
end
"""

if __FILE__ == $0
  puts (1..STDIN.gets.to_i-2).inject(1,:*)*2
end
