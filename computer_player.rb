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
      
      # Create two sets of all possible codes
      @possible_solutions = Code.colours.repeated_permutation(4).to_a
      
      print "Guess #{guesses + 1}:  "
      guess = Code.new(['red', 'red', 'green', 'green'])

      # Delete the guess from the possible solutions and duplicate the array
      # to create an array of all unused codes
      @possible_solutions.delete(guess.code_array)
      @unused_codes = @possible_solutions.dup

      @last_guess = guess
      return guess
    end
    
    puts " #{hints}" if hints
    @possible_solutions.each do |solution|
      possible_solution_hint = Code.new(solution).get_hints(@last_guess)
      unless possible_solution_hint.correct_positions == hints.correct_positions && possible_solution_hint.incorrect_positions == hints.incorrect_positions
        @possible_solutions.delete(solution)
      end
    end
    puts @possible_solutions.length

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