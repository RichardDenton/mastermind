class Hint
  attr_reader :correct_positions, :incorrect_positions

  def self.get_hint_combinations
    hint_values = [0, 1, 2, 3, 4]
    possible_combinations = hint_values.repeated_permutation(2).to_a
    possible_combinations.delete_if {|combination| combination[0] + combination[1] > 4}
  end

  @@possible_hint_combinations = get_hint_combinations

  def initialize(correct_positions, incorrect_positions)
    @correct_positions = correct_positions
    @incorrect_positions = incorrect_positions
  end
  
  def self.possible_hint_combinations
    @@possible_hint_combinations
  end

  def to_s
    hints = []
    
    @correct_positions.times do
      hints.push("●".yellow + " ")
    end

    @incorrect_positions.times do
      hints.push("●".white + " ")
    end

    hints.join

  end
end