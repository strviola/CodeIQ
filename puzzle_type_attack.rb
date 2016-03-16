# input from standard input
# split by line

if __FILE__ == $0
  lines = []
  STDIN.each_line do |line|
    break if line == "\n"
    lines << line.delete("\n").split(" ")
  end

  enemy_type = lines[0][0]
  power = {
    fire: lines[1][0].to_i,
    water: lines[1][1].to_i,
    tree: lines[1][2].to_i
  }

  attack = {}

  case enemy_type
  when "F" then
    attack[:fire] = power[:fire]
    attack[:water] = power[:water] * 2
    attack[:tree] = power[:tree] / 2
  when "W" then
    attack[:fire] = power[:fire] / 2
    attack[:water] = power[:water]
    attack[:tree] = power[:tree] * 2
  when "T" then
    attack[:fire] = power[:fire] * 2
    attack[:water] = power[:water] / 2
    attack[:tree] = power[:tree]
  end

  answer = []
  max = attack[:fire]

  attack.each do |type, value|
    if max == value
      answer << type
    elsif max < value
      answer = [type]
      max = value
    end
  end

  s = ""
  answer.each do |e|
    case e
    when :fire then s += "F"
    when :water then s += "W"
    when :tree then s += "T"
    end
  end

  puts s

end
