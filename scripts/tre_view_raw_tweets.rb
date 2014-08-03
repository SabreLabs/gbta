require "json"

input_file = ARGV[0]
output_file = ARGV[1]

tweets = []
File.open(input_file).each{|line| tweets << line} 

tre_view = {:data => tweets}
# File.open(output_file, "w+"){|f| f.puts(valid_json)}
puts JSON.generate(tre_view)
