require 'colorize'
require_relative "message"
require_relative "player"
require_relative "computer"

class InitializeGame
	attr_accessor:game_option, :mode, :level

  def initialize 
    init
  end

	def init
      welcome_note
      # get the player game mode
       @mode = gets.chomp
       mode = Player.choose_game_mode(@mode.downcase)
       #display the next game screen base on the player option selected
       arr_options = ["p","b","i","q"]
       mode = mode.downcase
       mode = mode.to_s
       puts mode 

       if arr_options.include? mode 
          case mode
           when "q" # call the quit to exit the game
            Message.new("Thank you good bye!".colorize(:red))
           when "p" #call the play game  
            play_game # call the start game handle
          end
         else
          Message.new("You have entered a wrong input") #output a message to the user concerning a wrong input
          self.init # call the init game agian when the user input a wrong input
      end
	end

    def play_game
       computer_generated_color  = "" # capture the computer generated code here
       display_player_level # call the display on the player level in order to know which code to generate for the player
       @level = gets.chomp
       level = Player.choose_game_level(@level) # This returns the level to which the player to  play
       level_keys = [1,2,3]
      if level_keys.include? level.to_i 
         if level == 1
           computer_generated_color = Computer.beginner_code # The beginner generated color codes in array
           elsif level == 2
           computer_generated_color = Computer.intermediate_code # The Intermediate generated color codes in array
           elsif level == 3
           computer_generated_color = Computer.advanced_code # The Advanced generated color codes in array
         end
        Message.new("So Would you like to play?".colorize(:green))
        Message.new("So start by telling me your name:".colorize(:green))
        player = gets.chomp
        comp_guess = Computer.begin(computer_generated_color.shuffle) #output to the player the pattern of the color expected from the player
        run_guesses(computer_generated_color)
       else
        Message.new("You have entered a wrong level option") #output a message to the user concerning a wrong input
        self.play_game # call the init level agian when the user input a wrong input
        end
      end
    end
          
    def display_guess_console
      player_guess = gets.chomp # get the player guess
      player_guess = player_guess.downcase #convert the player guess to upcase 
      return player_guess
    end

    def run_guesses(comp_guess,attempts=0,guesses=0)
      #no_of_attemps = 0 #Number of attempts the player made before the game terminates
      #no_of_guess = 0 # Number of chances the user has before starting the game
       while guesses < 12 do 
            
          player_guess = display_guess_console #called the console function to return the player guess input

          if player_guess.to_s == "q"
              Message.new("Thank you good bye!".colorize(:red))
              break
            elsif guesses >= 12
              Message.new("Congratulations !".colorize(:red))  
             else
            #get the user guess and the guess must not be greater than the length of the computer generated code
            if (player_guess.length.to_i < comp_guess.length.to_i) || (player_guess.length.to_i > comp_guess.length.to_i)
              Message.new("Try again!")
              #run_guesses(comp_guess,attempts,guesses)
              #playerguess = display_guess_console
            else
               guesses+=1
               attempts+=1
              puts "No of guesses #{guesses}, No of attempts #{attempts}"
            end
           end
        end
    end

	def welcome_note 
       welcome = "welcome to MASTERMIND!"
       game_mode_info = "Would you like to " + "(p)lay".colorize(:green) + " , read the " + "(i)nstructions".colorize(:blue) + " or a little " + " (b)ackground".colorize(:yellow) + " of MasterMind or " + "(q)uit;".colorize(:red)
       Message.new(welcome)
       Message.new(game_mode_info)
	end

	def display_player_level
	  game_starter_info = "To start the game select a level you Would like to play:"
    beginner_info = "Enter (1) for Beginner"
	  intermediate_info = "Enter (2) for Intermediate"
	  advanced_info = "Enter (3) for Advanced"
	  Message.new(game_starter_info)
	  Message.new(beginner_info)
	  Message.new(intermediate_info)
	  Message.new(advanced_info)
end

Play = InitializeGame.new