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

end