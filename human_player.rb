class Human_Player < Player

  def set_code
    nil
  end

  def get_guess(guesses, hints)
    if guesses == 0
      puts
      puts "Make a guess at the code, the possible colours are:"
      puts Code.possible_colours
      puts
    end

    if hints
      # puts "\nHere are your hints:"
      puts " #{hints}"
    end
    
    puts "\nEnter each colour separated by a space"
    print "guess #{guesses + 1}: "
      
    valid_guess = false
    until valid_guess do
      guess = gets.chomp
      guess_array = guess.split(' ')
      guess_array.length != 4 ? valid_guess = false : valid_guess = Code.is_valid?(guess_array)
      print "\nPlease enter four valid colours separated by spaces\nguess #{guesses + 1}: " unless valid_guess  
    end
      
    puts "\nyour guess is:"
    Code.new(guess_array)
  end

  def end_attempt(code_broken, code)
    puts
    if code_broken
      puts "Congratulations you broke the code!"
    else
      puts "You have used all of your attempts. Better look next time, the code was:"
      puts code
    end
  end
end
