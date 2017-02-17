def bubble_sort_by(input_array)
	
	input_array.length.times do
		input_array.each_with_index do |word, index|	
			if index < input_array.length - 1
				if yield(input_array[index], input_array[index+1]) < 0 
					#Compare the current number to the next number
					if word.length > input_array[index+1].length 
						#Swap the numbers
						temp_number = word
						input_array[index] = input_array[index+1]
						input_array[index+1] = temp_number
					end
				elsif yield(input_array[index], input_array[index+1]) > 0
					#Compare the current number to the next number
					if word.length > input_array[index+1].length
						#Swap the numbers
						temp_number = word
						input_array[index] = input_array[index+1]
						input_array[index+1] = temp_number
					end
				end
			end
		end
	end
	p input_array
end

bubble_sort_by(["hi","hello","hey"]) do |left, right|
	left.length - right.length
end

