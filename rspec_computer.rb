
require_relative "computer"

RSpec.describe "It generate matches and partial from the color code combination" do

	it "Can generate 4 matches 0 partial match" do
		computer_generated_response = Computer.partial_and_matches(["G","B","R","Y"],"GBRY")
		expect(computer_generated_response).to eql("4 exact match and 0 partial found")
	end

	it "Can generate 2 matches 2 partial match" do
		computer_generated_response = Computer.partial_and_matches(["G","B","R","Y"],"GRBY")
		expect(computer_generated_response).to eql("2 exact match and 2 partial found")
	end

	it "Can generate 1 matches 3 partial match" do
		computer_generated_response = Computer.partial_and_matches(["G","B","R","Y"],"YGRB")
		expect(computer_generated_response).to eql("1 exact match and 3 partial found")
	end

	it "Can generate O matches 4 partial match" do
		computer_generated_response = Computer.partial_and_matches(["G","B","R","Y"],"YGBR")
		expect(computer_generated_response).to eql("0 exact match and 4 partial found")
	end
end