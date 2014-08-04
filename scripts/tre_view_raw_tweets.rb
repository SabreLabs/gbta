require "json"

input_file = ARGV[0]
output_file = ARGV[1]

tweets = []
File.open(input_file).each{|line| tweets << JSON.parse(line)} 

tre_view_json = JSON.generate({:data => tweets})
File.open(output_file, "w+"){|f| f.puts(tre_view_json)}
