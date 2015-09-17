require_relative "player"

RSpec.describe "The player can select the game mode and the level"  do

	it "Expect the player to return a p back to the main program denoting playing the game" do
		return_code = Player.choose_game_mode("p")
		expect(return_code).to eql("p")
	end

	it "Expect that when the player press i it should return a i back to the main program for reading instructions of the game" do
		return_code = Player.choose_game_mode("i")
		expect(return_code).to eql("i")
	end

	it "Expect the player to return a q back to the main program to exit from the mastermind game" do
		return_code = Player.choose_game_mode("q")
		expect(return_code).to eql("q")
	end

	it "Expect the player to return a b back to the main program to show the background information about mastermind game" do
		return_code = Player.choose_game_mode("b")
		expect(return_code).to eql("b")
	end

    it "Expect the player to return the game level they want to play" do
		return_code = Player.choose_game_level(1)
		expect(return_code).to eql(1)
	end

	it "Expect the player to return the game level they want to play" do
		return_code = Player.choose_game_level(2)
		expect(return_code).to eql(2)
	end

	it "Expect the player to return the game level they want to play" do
		return_code = Player.choose_game_level(3)
		expect(return_code).to eql(3)
	end


end
	