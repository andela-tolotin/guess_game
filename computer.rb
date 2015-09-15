class Computer 

  def self.beginner

     color_combination = "(v)iolet, (g)reen, (y)ellow and (r)ed.";
      Message.new("I have generated a beginner sequence with four elements made up of:
    #{color_combination} You are to guess the sequence in which these colors appeared e.g VGYR for (v)iolet, (g)reen, (y)ellow and (r)ed. You have
    12 guesses to get these colors or you lose the game. Use (q)uit at any time to end the game.")
    Message.new("Ready to play?")
    Message.new("What's your guess?")
  end

  def self.beginner_code
    colors = ["R", "G", "B", "Y"]
     array = []
     4.times { array << rand(5)}
     generated_colors = array.collect { |i| colors[i] }
     return generated_colors
  end

  def self.intermediate_code
     colors = ["R", "G", "B", "Y", "V"]
     array = []
     6.times { array << rand(5)}
     generated_colors = array.collect { |i| colors[i] }
     return generated_colors
  end

  def self.advanced_code
    colors = ["R", "G", "B", "Y", "V","I"]
     array = []
     8.times { array << rand(6)}
     generated_colors = array.collect { |i| colors[i] }
     return generated_colors

  end

end