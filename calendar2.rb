# require day of week in original calendar
# https://codeiq.jp/challenge/2597

def leap?(year)
  if year % 4000 == 0
    true
  elsif year % 80 == 0
    false
  elsif year % 20 == 0
    true
  else
    false
  end
end

def get_days_of_month(month, year)
  case month
  when 'E'
    leap?(year) ? 31 : 32
  when 'A', 'B', 'D', 'F', 'H', 'I', 'K'
    31
  when 'C', 'G', 'J'
    32
  end
end

def get_days_to_first(month, year)
  days = 0
  'A'.ord.upto(month.ord - 1).each do |m|
    days += get_days_of_month(m.chr, year)
  end
  return days
end

if __FILE__ == $0
  lines = []
  STDIN.each_line do |line|
    lines << line.delete("\n").split(".")
  end

  year = lines[0][0].to_i # 1600 - 1000000
  month = lines[0][1] # A - K (11)
  d = lines[0][2].to_i # 1 - 31/32

  YEAR_FIRST = 1600
  y = 0
  1.upto(year - YEAR_FIRST).each do |each_year|
    y += leap?(each_year) ? 344 : 345
  end

  m = get_days_to_first(month, year)
  puts (((y + m + d - 1) % 7) + 't'.ord).chr
end
