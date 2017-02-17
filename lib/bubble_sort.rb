def bubble_sort(input_array)
	
	input_array.length.times do
		input_array.each_with_index do |number, index|
			if index < input_array.length - 1
				#Compare the current number to the next number
				if number > input_array[index+1] 
					#Swap the numbers
					temp_number = number
					input_array[index] = input_array[index+1]
					input_array[index+1] = temp_number
				end
			end
		end
	end

	p input_array

end

bubble_sort([4,3,78,2,0,2])