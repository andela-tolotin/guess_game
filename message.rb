class Message

attr_accessor:player_name, :response


    def welcome_the_player

    end


    private
    
	def get_message

		puts "Welcome to my MASTERMIND!"
		puts "Would you like to to (p)lay read the (i)nstructions or (q)uit;"
        @response  = gets.chomp

         case @response 

         when "p"
         	puts "Playing mode activated"
         when "i"
         	puts "Instruction mode"
         when "q"
         	puts "Terminate the while loop"
         else
         puts "Choose among the options in brackets above"	
         end

	end

	def greet_user

       puts "Enter your name"

       player_name = gets.chomp

		if player_name.nil? 

			puts "I need a Player name"
		else
			puts "Welcome #{player_name}"
		end
	end


	def game_introduction


	end

end


msg = Message.new
msg.get_message
msg.greet_user