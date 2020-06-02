class Hint
  def initialize(correct_positions, incorrect_positions)
    @correct_positions = correct_positions
    @incorrect_positions = incorrect_positions
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