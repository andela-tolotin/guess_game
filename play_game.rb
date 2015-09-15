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
       mode = Player.choose_game_mode(@mode)
       #display the next game screen base on the player option selected
       arr_options = ["p","q","i","b"]
       mode = mode.downcase.to_s
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
      display_player_level # call the display on the player level in order to know which code to generate for the player
      guesses = 12
      Message.new("So Would you like to play?".colorize(:green))
      Message.new("So start by telling me your name:".colorize(:green))
      player = gets.chomp

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
    @level = gets.chomp
    level = Player.choose_game_level(@level)
    level_keys = [1,2,3]
    if level_keys.include? level.to_i 
         if level == 1
         elsif level == 2
          Message.new("level 2")
         elsif level == 3
           Message.new("level 3")
         end
       else
        Message.new("You have entered a wrong level option") #output a message to the user concerning a wrong input
        self.display_player_level # call the init level agian when the user input a wrong input
      end
	end

end

Play = InitializeGame.new