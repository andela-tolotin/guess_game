class Computer 

  def self.beginner
     space = "a".."z".to_a.shuffle[0..4]
     color_combination = "(v)iolet, (g)reen, (y)ellow and (r)ed.";
      Message.new("I have generated a beginner sequence with four elements made up of:
    #{color_combination} You are to guess the sequence in which these colors appeared e.g VGYR for (v)iolet, (g)reen, (y)ellow and (r)ed. You have
    12 guesses to get these colors or you lose the game. Use (q)uit at any time to end the game.")
    Message.new("Ready to play?")
    Message.new("What's your guess?")
     return space
  end

  def self.Intermediate

  end

  def self.Advanced

  end

end