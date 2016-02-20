require 'byebug'

mountain = []

File.open("test.txt",'r') do |f|
	f.each_line do |line|
		mountain << line.split(" ").map(&:to_i)
	end
end

dim = mountain.shift
possible_paths = []

# Find every possible routes
# Storing every possible initial point
# Change it to normal coordinates point
mountain.each_with_index do |row,y|
	row.each_with_index do |element,x|
		possible_paths << [[x,y]]
	end
end

possible_paths.each do |path_array|
	
	# Always take the last coordinates point ...
	x = path_array.last[0] 
	y = path_array.last[1] 

	coord = mountain[y][x]
	# Compare the point to their neightbouring point
	# & compare with different direction

	# Compare north
	if y > 0 && mountain[y-1][x] < coord		
		new_path = path_array.dup
		new_path << [x,y-1]
		# Append it into the array
		possible_paths << new_path		
	end

	# Compare east
	if x < dim[0] - 1 && mountain[y][x+1] < coord	
		new_path = path_array.dup
		new_path << [x+1,y]
		possible_paths << new_path	
	end

	# Compare south
	if y < dim[1] - 1 && mountain[y+1][x] < coord
		new_path = path_array.dup
		new_path << [x,y+1]
		possible_paths << new_path	
	end

	# Compare west
	if x > 0 && mountain[y][x-1] < coord	
		new_path = path_array.dup
		new_path << [x-1,y]
		possible_paths << new_path
	end
end
# To find the max length of the array
max_length = possible_paths.max_by{|a| a.length}
arrays_with_max_length = possible_paths.find_all{|x| x.length == max_length.length}

all_elevation_arr = []

# Return the elevation instead of coordinates
arrays_with_max_length.each do |arr|
	elevation_arr = []
	arr.each do |coord|
		x = coord[0]
		y = coord[1]

		elevation_arr << mountain[y][x]	
	end
	all_elevation_arr << elevation_arr
end

# Compare the drop
ans = all_elevation_arr.max_by do |a|
	a.first - a.last
end

puts "The longest path is the path of #{ans} with the length of #{ans.length} & the drop of #{ans.first - ans.last}"