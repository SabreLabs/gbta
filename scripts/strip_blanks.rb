require "json"

input_file = ARGV[0]
output_file = ARGV[1]

def valid_json?(json)
  begin JSON.parse(json)
    return true
  rescue StandardError => e
    return false
  end
end

valid_json = []
File.open(input_file).each {|line| valid_json << line if valid_json?(line)}
puts "writing #{valid_json.length} elements to #{output_file}"
File.open(output_file, "w+"){|f| f.puts(valid_json)}
