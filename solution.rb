require 'byebug'

array = []

File.open("simple.txt",'r') do |f|
	f.each_line do |line|
		array << line.split(" ").map(&:to_i)
	end
end

dim = array.shift

possible_routes = []
route = []


# Find every possible routes
# Storing every possible initial point
array.each_with_index do |row,y|
	row.each_with_index do |element,x|
		possible_routes << [x,y]
	end
end




# Compare the point to their neightbouring point


# Store it into an array
# Compare the length of the possible routes
# Compare the max drop