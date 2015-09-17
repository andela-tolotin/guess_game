require 'colorize'
require_relative "message"
require_relative "player"
require_relative "computer"
require_relative "playerscore"

class InitializeGame
	attr_accessor:game_option, :mode, :level, :player, :computer_generated_color
  
def initialize 
  init
end

def init
  welcome_note
  # get the player game mode
  @mode = gets.chomp
  mode = Player.choose_game_mode(@mode.downcase)
  #display the next game screen base on the player option selected
  mode_options = ["p","b","i","q"]
  mode = mode.downcase
  mode = mode.to_s
  if mode_options.include? mode 
    case mode
      when "q" # call the quit to exit the game
        Message.new("Thank you good bye!".colorize(:red))
        when "p" #call the play game  
          play_game # call the start game handle
        when "i"
          game_info #call the game informtion
          init # call play game again to further continue the game after reading the instructions
        when "b"
          game_background # back of the game called Mastermind
          init #call the game to start again
    end
  else
    Message.new("You have entered a wrong input".colorize(:red)) #output a message to the user concerning a wrong input
    self.init # call the init game agian when the user input a wrong input
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

def play_game
  @computer_generated_color  = "" # capture the computer generated code here
  display_player_level # call the display on the player level in order to know which code to generate for the player
  @level = gets.chomp
  @level = Player.choose_game_level(@level) # This returns the level to which the player to  play
  level_keys = [1,2,3]
  if level_keys.include? level.to_i 
    if @level == 1
      @computer_generated_color = Computer.beginner_code # The beginner generated color codes in array
    elsif @level == 2
      @computer_generated_color = Computer.intermediate_code # The Intermediate generated color codes in array
    elsif @level == 3
      @computer_generated_color = Computer.advanced_code # The Advanced generated color codes in array
    end
    Message.new("So Would you like to play?".colorize(:green))
    Message.new("So start by telling me your name:".colorize(:green))
    @player = gets.chomp
    comp_guess = Computer.begin(@computer_generated_color.shuffle) #output to the player the pattern of the color expected from the player
    run_guesses(@computer_generated_color)
  else
    Message.new("You have entered a wrong level option",colorize(:red)) #output a message to the user concerning a wrong input
    self.play_game # call the init level agian when the user input a wrong input
  end
end
end
      
def game_info 
  Message.new("Enter a sequence of 4 colors containing the generated colors e.g RYBG or YGRB.If you enter fewer than 4 or more than 4 colors, you would receive an error message")
end 

def game_background
  Message.new("Just a little background on MASTERMIND Mastermind is a board game with an interesting history (or rather a legend?). Some game books report that it was invented in 1971 by Mordecai Meirowitz, an Israeli postmaster and telecommunications expert. After many rejections by leading toy companies, the rights were obtained by a small British firm, Invicta Plastics Ltd. The firm originally manufactured the game itself, though it has since licensed its manufacture to Hasbro in most of the world. However, Mastermind is just a clever readaptation of an old similar game called 'Bulls and cows' in English, and 'Numerello' in Italian... Actually, the old British game 'Bulls and cows' was somewhat different from the commercial version. It was played on paper, not on a board... Over 50 million copies later, Mastermind is still marketed today! The idea of the game is for one player (the code-breaker) to guess the secret code chosen by the other player (the code-maker). The code is a sequence of 4 colored pegs chosen from six colors available. The code-breaker makes a series of pattern guesses - after each guess the code-maker gives feedback in the form of 2 numbers, the number of pegs that are of the right color and in the correct position, and the number of pegs that are of the correct color but not in the correct position - these numbers are usually represented by small black and whitepegs. In 1977, the mathematician Donald Knuth demonstrated that the code-breaker can solve the pattern in five moves or less, using an algorithm that progressively reduced the number of possible patterns.")
end  

def display_guess_console
  player_guess = gets.chomp # get the player guess
  player_guess = player_guess.downcase #convert the player guess to downcase 
  return player_guess
end

def try_again
  Message.new("Do you want to (p)lay again or (q)uit or (t)op_players?")
  player_option = display_guess_console
  case player_option.to_s
    when "p"
      if @level == 1
        @computer_generated_color = Computer.beginner_code # The beginner generated color codes in array
      elsif @level == 2
        @computer_generated_color = Computer.intermediate_code # The Intermediate generated color codes in array
      elsif @level == 3
        @computer_generated_color = Computer.advanced_code # The Advanced generated color codes in array
      end
      comp_guess = Computer.begin(@computer_generated_color.shuffle) #output to the player the pattern of the color expected from the player
      run_guesses(@computer_generated_color)
    when "q"
      Message.new("Thank you for playing MasterMind,"+"#{@player}!".capitalize.colorize(:green))
      Message.new("Good Bye!".colorize(:red))
    when "t" 
      Message.new(ReadWritePlayerScore.read_top_ten(@computer_generated_color))
      try_again
    end
end

def run_guesses(comp_guess,attempts=0,guesses=0)
  start_time = 0.0 
  end_time = 0.0 
  start_time = Time.now # the time the execution begin
  while guesses < 12 do 
    player_guess = display_guess_console #called the console function to return the player guess input
    if player_guess.to_s == "q"
      Message.new("Thank you for playing MasterMind,"+"#{@player}!".capitalize.colorize(:green))
      Message.new("Good Bye!".colorize(:red))
      break
    else
      #get the user guess and the guess must not be greater than the length of the computer generated code
       if player_guess == "c"
          Message.new("You really want to cheat, anyway see the code below".colorize(:green))
          Message.new("The color sequence generated by the computer were " + computer_generated_color.join("").colorize(:blue))
          Message.new("Enter the code below to win! ".colorize(:blue))
      elsif (player_guess.length.to_i < comp_guess.length.to_i) || (player_guess.length.to_i > comp_guess.length.to_i && player_guess != "c")
        Message.new("Your guess input was either too short or too long".colorize(:red))
        Message.new("Try again!".colorize(:red))
      else
        guesses += 1
        attempts += 1
        p_guess = player_guess.upcase.split("") # split and turn the player guess input into array
        if comp_guess.zip(p_guess).all? { |c,p| c===p } && guesses >= 12
          Message.new(Computer.partial_and_matches(comp_guess,player_guess))
          Message.new("Oop! you got the sequence but on last try".colorize(:red))  
          end_time = Time.now 
          Message.new("You finished with #{attempts} attempts in #{time_diff(start_time, end_time)}")
          try_again
          break
        elsif comp_guess.zip(p_guess).all? { |c,p| c===p }
          end_time = Time.now
          Message.new(Computer.partial_and_matches(comp_guess,player_guess))
          Message.new("Congratulations! " + "#{@player}".capitalize.colorize(:green)) 
          Message.new("You finished with #{attempts} attempts in #{end_time-start_time}")
          ReadWritePlayerScore.open_score_file(comp_guess,@player,attempts,(end_time-start_time).floor) # write to the file for the player
          try_again
          break
        elsif guesses >= 12
          end_time = Time.now 
          Message.new("You lost!".colorize(:red))  
          Message.new("The color sequence generated by the computer were " + computer_generated_color.join("").colorize(:red))
          try_again
          break
        else
          Message.new(Computer.partial_and_matches(comp_guess,player_guess))
          Message.new("No of attempts #{guesses}, attempts left #{12-attempts}") 
        end
      end
    end  
  end
end

def time_diff(start_time, end_time)
  seconds_diff = (start_time - end_time).to_i.abs
  hours = seconds_diff / 3600
  seconds_diff -= hours * 3600
  minutes = seconds_diff / 60
  seconds_diff -= minutes * 60
  seconds = seconds_diff
  return "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
end

Play = InitializeGame.new