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
		  write_line = "#{player} | #{attempts} | #{exec_time}"
		  File.open(filename,"a+") { |f| f.puts write_line }
		end
	end

	def self.read_top_ten (comp_code)
	  response = ""
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
      player_exec_time[player+"#"+attempts] = exec_time.to_i
	  }
	  player_exec_time = player_exec_time.sort_by { |k,v| v} #Sorting the player accoring to time taken to complete the color guess
      response+= "Top Players\n"
	  response+= "==============\n"
	  counter = 0 #counter 
	  player_exec_time.each do |key,val|
	  p_factor = key.split("#")
	  player_name = p_factor[0].capitalize
	  attempts = p_factor[1]
	  counter+=1
	  val = Time.at(val).utc.strftime("%M:%S") # convert the player time spent in seconds to minutes and seconds 
	  response += "#{counter}. #{player_name} finishes with #{attempts} attempt(s) in #{val}secs \n"
	  break if counter >= 10
    end 
      response+= "==============\n"
     end
     return response
 end
end
#puts ReadWritePlayerScore.read_top_ten(comp_code="rrrr")
