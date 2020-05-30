class Human_Player < Player

  def set_code
    nil
  end

  def break_code
    guesses = 0
    code_broken = false
    
    puts
    puts "Make a guess at the code, the possible colours are:"
    puts Code.possible_colours
    puts

    until guesses == 12 || code_broken do
      puts "Enter each colour separated by a space"
      
      valid_guess = false
      until valid_guess do
        guess = gets.chomp
        guess_array = guess.split(' ')
        guess_array.length != 4 ? valid_guess = false : valid_guess = Code.is_valid?(guess_array)
        puts "\nPlease enter four valid colours separated by spaces" unless valid_guess  
      end
      
      puts "\nyour guess is:"
      puts Code.new(guess_array)
      puts
      guesses += 1
    end
  end

end
