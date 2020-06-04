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
      
      print_guess_number(guesses)
      guess = get_first_guess

      # Delete the guess from the possible solutions and duplicate the array
      # to create an array of all unused codes
      @possible_solutions.delete(guess.code_array)
      @unused_codes = @possible_solutions.dup

      @last_guess = guess
      return guess
    end
    
    puts " #{hints}" if hints
    print_guess_number(guesses)
    
    remove_possible_solutions(hints)
    if @possible_solutions.length == 1
      return Code.new(@possible_solutions[0])
    end

    guess = find_best_guess
    @unused_codes.delete(guess.code_array)
    @possible_solutions.delete(guess.code_array)
    @last_guess = guess
    guess
  end

  def get_first_guess
    # Generates a random first guess for the computer that consists of two repeated colours
    # eg 'red red white white'
    possible_first_guesses = Code.colours.repeated_combination(4).to_a
    possible_first_guesses.delete_if do |guess|
      guess[0] != guess[1] || guess[2] != guess[3] || guess[0] == guess[2]
    end
    
    Code.new(possible_first_guesses.sample(1)[0])
  end
  
  def remove_possible_solutions(hints)
    # Remove any possible solutions that give different hints for the previous guess
    @possible_solutions.delete_if do |solution|
      possible_solution_hint = Code.new(solution).get_hints(@last_guess)
      possible_solution_hint.correct_positions != hints.correct_positions || possible_solution_hint.incorrect_positions != hints.incorrect_positions
    end
  end

  def find_best_guess
    # Use minmax find the guess whose minumum number of eliminated possible solutions is the highest  
    eliminations = {}
    @unused_codes.each do |unused_code|
      elimination_count = Hash.new(0)
      @possible_solutions.each do |solution|
        test_hint = Code.new(solution).get_hints(Code.new(unused_code))
        hint_array = [test_hint.correct_positions, test_hint.incorrect_positions]
        elimination_count[hint_array] += 1
      end
      lowest_possible_eliminations = @possible_solutions.length - elimination_count.max_by{|k, v| v}[1]
      eliminations[unused_code] = lowest_possible_eliminations
    end
    Code.new(eliminations.max_by{|k, v| v}[0])
  end

  def print_guess_number(guesses)
    if (guesses + 1).to_s.length < 2
      print "Guess #{guesses + 1}:  "
    else
      print "Guess #{guesses + 1}: "
    end
  end

  def end_attempt(code_broken, code)
    puts
    if code_broken
      puts "The computer broke your code!"
    else
      puts "The computer failed to break your code"
    end
    play_again?
  end

end