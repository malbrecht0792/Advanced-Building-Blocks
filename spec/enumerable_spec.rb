require "enumerable"

describe "Enumerable" do

	let(:my_array) do
		[1,2,3,4]
	end

	describe "my_each" do
		context "given an array" do
			it "returns each item of the array" do	
				expect{ |b| my_array.my_each(&b)}.to yield_successive_args(1,2,3,4)
			end
		end
	end

	describe "my_each_with_index" do
		context "given an array" do
			it "returns each item of the array along with its index" do
				expect{ |b| my_array.my_each_with_index(&b)}.to yield_successive_args([1,0],[2,1],[3,2],[4,3])
			end
		end
	end

	describe "my_select" do
		context "given an array with a block" do
			it "returns the values that pass the block" do
				expect( my_array.my_select{|item| item%2==0}).to match([2,4])
			end
		end
	end

	describe "my_all?" do
		context "given an array with a block" do
			it "returns true if every item of the array passes the block" do
				expect(my_array.my_all?{|item| item<10}).to be_truthy
			end
		end
	end

	describe "my_any?" do
		context "given an array and a block" do
			it "returns true if any item in the array passes the block" do
				expect(my_array.my_any?{|item| item==4}).to be_truthy
			end
		end
	end

	describe "my_none?" do
		context "given an array and a block" do
			it "returns true if none of the items in the array pass the block" do
				expect(my_array.my_none?{|item| item==5}).to be_truthy
			end
		end
	end
end




