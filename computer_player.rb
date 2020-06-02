class Computer_Player < Player

  def set_code
    code = []
    4.times do
      code.push(Code.colours.sample)
    end
    Code.new(code)
  end

  def get_guess(guesses, hints)
    if guesses == 0
      puts "\nThe computer is attempting to crack your code..."
    end
    
    puts "#{hints}" if hints
    code = []
    4.times do
      code.push(Code.colours.sample)
    end
    if (guesses + 1).to_s.length < 2
      print "Guess #{guesses + 1}:  "
    else
      print "Guess #{guesses + 1}: "
    end
    Code.new(code)
  end

  def end_attempt(code_broken, code)
    puts
    if code_broken
      puts "The computer broke your code!"
    else
      puts "The computer failed to break your code"
    end
  end

end