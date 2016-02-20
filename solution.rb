array = []

File.open("simple.txt",'r') do |f|
	f.each_line do |line|
		array << line.split(" ")
	end
end

p array