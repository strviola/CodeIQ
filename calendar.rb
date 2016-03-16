# require day of week in original calendar
# https://codeiq.jp/challenge/2597

def get_days_of_month(month)
  case month
  when 'A', 'B', 'D', 'F', 'H', 'I', 'K'
    31
  when 'C', 'E', 'G', 'J'
    32
  end
end

def get_days_to_first(month)
  days = 0
  'A'.ord.upto(month.ord - 1).each do |m|
    days += get_days_of_month(m.chr)
  end
  return days
end

if __FILE__ == $0
  lines = []
  STDIN.each_line do |line|
    lines << line.delete("\n").split(".")
  end

  year = lines[0][0].to_i # 500 - 1599
  month = lines[0][1] # A - K (11)
  day = lines[0][2].to_i # 1 - 31/32

  YEAR_FIRST = 500
  DAYS_OF_YEAR = 345

  years_count = (year - YEAR_FIRST) * DAYS_OF_YEAR
  month_count = get_days_to_first(month)

  day_from_first = years_count + month_count + day

  case day_from_first % 7
  when 1
    puts 't'
  when 2
    puts 'u'
  when 3
    puts 'v'
  when 4
    puts 'w'
  when 5
    puts 'x'
  when 6
    puts 'y'
  when 0
    puts 'z'
  end

end
