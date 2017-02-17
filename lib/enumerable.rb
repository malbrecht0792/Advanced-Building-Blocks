module Enumerable

	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0 
		while i < self.size
			yield(self[i],i)
			i += 1
		end
		self
	end

	def my_select
		select_array = []
		self.my_each do |item|
			#adds the item to the select array if the item returns true from the block
			select_array.push(item) if yield(item)
		end
		p select_array
	end

	def my_all?
		i = 0
		while i < self.size
			unless yield(self[i])
				p false
				return
			end
			i += 1
		end
		p true
	end

	def my_any?
		i = 0
		while i < self.size
			if yield(self[i])
				p true
				return
			end
			i += 1
		end
		p false
	end

	def my_none?
		i = 0
		while i < self.size
			if yield (self[i])
				p false
				return
			end
			i += 1 
		end
		p true
	end

	def my_count(val=nil)
		if val
			p self.my_select{|item| item == val}.size
		elsif block_given?
			p self.my_select{|item| yield item}.size
		else	
			p self.size
		end
	end

	def my_map(&proc)
		puts "MY MAP!!!"
		i = 0 
		return_array = []
		if block_given?
			puts "Block Given"
			while i < self.size
				return_array.push(proc.call yield(self[i]))
				i += 1
			end
			p return_array
		else
			puts "Proc Given"
			self.to_enum
		end
	end

	def my_inject(accumulator = self[0])
		i = 0
		while i < self.size
			accumulator = yield(accumulator, self[i]) unless i == 0
			i += 1
		end
		p accumulator
	end

	def multiply_els
		p self.my_inject{ |result, element| result * element }
	end

end

[1,2,3].my_each{|x| puts x}
[1,2,3].my_each_with_index{|x, index| puts "value: #{x}, index: #{index}"}
my_array = [1,2,3,4,5,6,7,8,100]
my_array.my_select{|item| item%2==0 }
my_array.my_all?{|item| item < 200}
my_array.my_any?{|item| item > 50}
my_array.my_none?{|item| item > 100}
[1,2,3,4,5,6,7,8,100].my_count
[1,2,3,4,4,6,7,8,100].my_count(4)
[1,2,3,4,4,6,7,8,100].my_count{|i| i.even?}
["tokyo","london", "rio"].my_map{|item| item.capitalize}
[1, 2, 3, 4].my_inject{ |result, element| result + element }
[2,4,5].multiply_els

my_proc = Proc.new { |arg1| print "#{arg1}! " }
[1,2,3].my_map(&my_proc)









