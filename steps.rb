# https://codeiq.jp/challenge/2730

if __FILE__ == $0
  lines = []
  STDIN.each_line do |line|
    lines << line.delete("\n")
  end

  all_count = lines.size
  comment_count = lines
    .select { |line| line.match(/^#/) }.size

  puts "code:#{all_count - comment_count}"
  puts "comment:#{comment_count}"
end
