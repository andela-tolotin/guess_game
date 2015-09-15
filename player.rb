class Player

attr_accessor:player

	def self.player_name(player_name)
		@player = player_name
		@player
	end

	def self.choose_game_mode(game_mode)
		@game_mode = game_mode.downcase
		if !@game_mode.nil?
			case @game_mode
			when "p"
			  return "p"
			when "i"
			  return "i"
			when "q"
			  return "q"
			when "b"
			  return "b"
			else
              
			end
		end
	end

	def self.choose_game_level(player_level)
		@p_level = player_level.to_i
		if @p_level == 1
			return 1
		  elsif @p_level == 2
			return 2
		  elsif @p_level == 3
		  	return 3
		end		
	end

end