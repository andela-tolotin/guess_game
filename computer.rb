class Computer 

  def self.begin(color_code)
     color_combination = self.convert_code_to_color(color_code)
     #determine the player level by their color code
    game_level = color_code.length.to_i
    game_info = ""
    if game_level == 4
      game_info = "I have generated a sequence with four elements made up of"
    elsif game_level == 5
      game_info = "I have generated a sequence with five elements made up of"
    else
      game_info = "I have generated a sequence with six elements made up of"
    end
      Message.new("#{game_info} : #{color_combination} You are to guess the sequence in which these colors appeared e.g RGBY for (r)ed, (g)reen, (y)ellow and (g)reen. You have 12 guesses to get these colors or you lose the game. Use (q)uit at any time to end the game.")
    Message.new("Ready to play?")
    Message.new("What's your guess?")
  end

  def self.convert_code_to_color(code)
    str_concat = ""
    if !code.empty?
      code.each { |c|
      case c
      when "R"
      str_concat+="(R)ed".colorize(:red) + ", "
      when "G"
      str_concat+="(G)reen".colorize(:green) + ", "
      when "B"
      str_concat+="(B)lue".colorize(:blue) + ", "
      when "Y"
      str_concat+="(Y)ellow".colorize(:yellow) + ", "
      when "V"
      str_concat+="(V)iolet".colorize(:violet) + ", "
     when "I"
      str_concat+="(I)ndigo".colorize(:indigo) + ", "
     end
      }
    end
    return str_concat
  end

  def self.beginner_code
    colors = ["R", "G", "B", "Y"]
     array = []
     4.times { array << rand(4)}
     generated_colors = array.collect { |i| colors[i] }
     return generated_colors
  end

  def self.intermediate_code
     colors = ["R", "G", "B", "Y", "V"]
     array = []
     5.times { array << rand(5)}
     generated_colors = array.collect { |i| colors[i] }
     return generated_colors
  end

  def self.advanced_code
    colors = ["R", "G", "B", "Y", "V","I"]
     array = []
     6.times { array << rand(6)}
     generated_colors = array.collect { |i| colors[i] }
     return generated_colors
  end

  def self.partial_and_matches(comp,player)
     player = player.upcase.split("")
     all = comp.zip(player)
     comp_array = []
     user_array = []
     matches = 0
     all.each do |a,b|
       if a===b 
       matches+=1
       else
       comp_array << a
       user_array << b
      end
    end
    comp_hash = Hash.new 0
      comp_array.each do |word|
      comp_hash[word] += 1
    end
    user_hash = Hash.new 0
      user_array.each do |word|
      user_hash[word] += 1
    end
    result =0
    user_hash.each do |key, value|
      if comp_hash[key] >= value
        result +=value
      else
        result +=comp_hash[key]
      end
   end
    return "#{matches}".colorize(:green) + " exact match and " + "#{result}".colorize(:blue) + " partial found "
 end 
end