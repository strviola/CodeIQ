# https://codeiq.jp/challenge/2024

def count(arr, ch)
  arr.select { |e| e == ch }.size
end

if __FILE__ == $0
  input =  STDIN.gets.delete("\n").split(':')

  prices = input[0].split(',').collect { |s| s.to_i }
  users = input[1].split(',')

  n_a = count(users, 'A')
  n_c = count(users, 'C')
  n_i = count(users, 'I')

  # puts "A:#{n_a}, C:#{n_c}, I:#{n_i}"

  # number of users of child to pay
  p_c = n_i - (n_a * 2)
  n_c += p_c >= 0 ? p_c : 0

  # puts "priced to A:#{n_a}, C:#{n_c}"

  total = 0
  prices.each do |price|
    c_p = price % 20 == 10 ? ((price / 2) + 5) * n_c : (price / 2) * n_c
    total += price * n_a
    total += c_p
  end
  puts total
end
