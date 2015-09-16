class ReadWritePlayerScore

	def self.open_score_file(comp_code,player,attempts,exec_time)
		level = comp_code.length.to_i
		if level == 4
			filename = "beginner.txt"
		elsif level == 5
			filename = "intermidiate.txt"
		elsif level == 6
			filename = "advance.txt"
		end

		if !comp_code.empty?
			wrap_line = "#{player} | #{attempts} | #{exec_time}"
			 File.open(filename,"a+") { |f| f.puts wrap_line }
		end
	end

	def self.read_top_ten (comp_code)
		response = ""
        arr_of_attempts = []
        players = []
        top_ten_hash = Hash.new(0)
        player_exec_time = Hash.new(0)
		level = comp_code.length.to_i

		if level == 4
			filename = "beginner.txt"
		 elsif level == 5
			filename = "intermidiate.txt"
		 elsif level == 6
			filename = "advance.txt"
			else
		    filename = ""
		end
	     # open the txt file

	     if !File.exist?(filename) || File.zero?(filename)
	     	response += "File not Exits or No Top Player for now!"
	     else
           f = File.open(filename, "r")
           # loop through each record in the txt file, adding
           f.each_line { |line|
           # each line has fields separated by commas, so split those fields
           fields = line.split('|')

           # do a little work here to get rid of double-quotes and blanks
           player =    fields[0].tr_s('"', '').strip
           attempts =  fields[1].tr_s('"', '').strip
           exec_time = fields[2].tr_s('"', '').strip
           top_ten_hash[player.capitalize] = attempts.to_i

           arr_of_attempts << attempts.to_i
           #players << {player.to_s => attempts.to_i}  # push each player into an array
           player_exec_time[player+"#"+exec_time] = attempts.to_i
		}
		
	       player_exec_time = player_exec_time.sort_by { |k,v| v} #Sorting the player accoring to their attempts
		   #arr_of_attempts = arr_of_attempts.sort.slice(0,10) # Sort the Array and bring out the top ten players
           response+= "Top 10 Players\n"
		   response+= "==============\n"
		   player_exec_time.each do |key,val|
		   p_factor = key.split("#")
		   	player_name = p_factor[0].capitalize
		   	exec_time = p_factor[1]
           response += "#{player_name} finishes with #{val} attempts in #{exec_time} secs \n"
           end 
         response+= "==============\n"
     end
     return response
	end
	
end

#puts ReadWritePlayerScore.read_top_ten(comp_code="rrrr")
