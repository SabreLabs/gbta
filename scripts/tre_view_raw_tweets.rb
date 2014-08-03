require "json"

def valid_json?(json)
  begin JSON.parse(json)
    return true
  rescue StandardError => e
    return false
  end
end

File.open(ARGV[0]).each do |line|
  puts "#{line_num += 1} #{line}" if valid_json?(line)
end
