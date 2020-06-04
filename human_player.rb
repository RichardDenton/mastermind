class Human_Player < Player
  @@colour_conversion = {'w' => 'white', 'r' => 'red', 'g' => 'green', 'b' => 'blue', 'm' => 'magenta', 'c' => 'cyan'}

  def set_code
    puts "Please enter your secret code, the available colours are:"
    puts Code.possible_colours
    puts "\nEnter the first letter of each colour eg: #{'r'.red + 'g'.green + 'b'.blue + 'c'.cyan}"
    print "\nCode: "
    code = get_code
    puts "\nYou have set the code"
    puts code
    code
  end

  def get_guess(guesses, hints)
    if guesses == 0
      puts "Make a guess at the code, the possible colours are:"
      puts Code.possible_colours
      puts "\nHints:".cyan
      puts "You will receive hints after each guess, a coloured peg"
      puts "means that a colour is in the right place, a white peg"
      puts "means there is a correct colour in the wrong place."
      puts "\nEnter the first letter of each colour eg: #{'r'.red + 'g'.green + 'b'.blue + 'c'.cyan}"
    end

    puts " #{hints}" if hints
    
    print "Guess #{guesses + 1}: "
    guess = get_code
    print "\nyour guess is: "
    guess
  end

  def get_code
    valid_code = false
    until valid_code do
      entered_code = gets.chomp.downcase
      entered_code_array = entered_code.split('')
      entered_code_array.length != 4 ? valid_code = false : valid_code = valid_colours?(entered_code_array)
      print "\nPlease enter four valid colours in the format rgbc\n: " unless valid_code  
    end

    converted_code_array = convert_colours(entered_code_array)
    Code.new(converted_code_array)
  end

  def valid_colours?(letters)
    valid_guess = true
    letters.each do |letter|
      valid_guess = false if !@@colour_conversion.has_key?(letter)
    end
    valid_guess
  end

  def convert_colours(letter_array)
    converted_colours = []
    letter_array.each do |letter|
      converted_colours.push(@@colour_conversion[letter])
    end
    converted_colours
  end
  
    def end_attempt(code_broken, code)
    puts
    if code_broken
      puts "Congratulations you broke the code!"
    else
      puts "You have used all of your attempts.\nBetter look next time! The code was:"
      puts code
    end
    play_again?
  end

  def self.colour_conversion
    @@colour_conversion
  end
end
