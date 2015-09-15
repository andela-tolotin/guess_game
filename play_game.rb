require 'colorize'
require_relative "message"
require_relative "player"
require_relative "computer"

class InitializeGame
	attr_accessor:game_option, :mode, :level

	def initialize 
      welcome_note
      # get the player game mode
       @mode = gets.chomp
       mode = Player.choose_game_mode(@mode)
       #display the next game screen base on the player option selected
        case mode 
        when "p"
       	display_player_level
       	play_game # call the start game handle

       end
	end
    
    private

    def play_game
      guesses = 12
      @level = gets.chomp
      Message.new("So Would you like to play?".colorize(:green))
      Message.new("So start by telling me your name:".colorize(:green))
      player = gets.chomp
      computer_code = Player.choose_game_level(@level)
      puts computer_code
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
end

Play = InitializeGame.new