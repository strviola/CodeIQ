# https://codeiq.jp/challenge/2561

def fact(n)
  return 1 if n == 0
  return n * fact(n - 1)
end

def fact_dup(n, a)
  fact(n) / (fact(a[1]) * fact(a[2]) * fact(a[3]) * fact(a[4]))
end

def get_list_9(n)
  n.upto(n * 4).select { |i| i % 9 == 0 }
end

def sum(list)
  if list.length > 0
    list.inject { |sum, e| sum + e }
  else
    0
  end
end

$sum_9_lists = []

def sum_9_list(n, m9, mark, work)
  if sum(work) == m9 && work.length == n
    $sum_9_lists << work
  elsif sum(work) >= m9 && work.length < n - 1
    return
  elsif sum(work) < m9
    if work.length >= n
      return
    else
      mark.downto(1).each do |mark_e|
        sum_9_list(n, m9, mark_e, work + [mark_e])
      end
    end
  end
end

def default_list(n, m9)
  sum_9_list(n, m9, 4, [])
end

patterns = 0

n = STDIN.gets.to_i
get_list_9(n).each do |m9|
  default_list(n, m9)
  $sum_9_lists.each do |s9list|
    a = []
    1.upto(4).each do |i|
      a[i] = s9list.select { |e| e == i }.length
    end
    patterns += fact_dup(n, a)
  end
  $sum_9_lists = []
end

puts patterns
