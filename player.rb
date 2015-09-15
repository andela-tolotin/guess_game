class Player

attr_accessor:player

	def self.player_name(player_name)
		@player = player_name
		@player
	end

	def self.choose_game_mode(game_mode)
		@game_mode = game_mode
		if !@game_mode.nil?
			case @game_mode
			when "p"
			  return "p"
			when "i"
			  return "info"
			when "q"
			  return "quit"
			when "b"
			  return "b"
			else
              
			end
		end
	end

	def self.choose_game_level(player_level)
		@player_level = player_level
		if !@player_level.nil?
			case @player_level
			 when 1
				Computer.beginner
			 when 2
			 	2
			 when 3
				3
			end
		end

	end

end