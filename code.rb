class Code
  attr_reader :code_array, :colour_occurances

  @@colours = ['red', 'green', 'blue', 'magenta', 'cyan', 'brown']

  def initialize(code_array)
    @code_array = code_array
    @colour_occurances = @code_array.reduce(Hash.new(0)) do |occurances, colour|
      occurances[colour] += 1
      occurances
    end
  end

  def to_s
    code = ''
    @code_array.each do |colour|
      bg_colour = 'bg_' + colour
      code += '    '.send(bg_colour.to_sym)
    end
    code
  end

  def code_cracked?(code_guess)
    code_guess.code_array == @code_array
  end

  def get_hints(guess)
    correct_positions = 0
    incorrect_positions = 0

    guess.code_array.each_with_index do |colour, index|
      # find number of colours in the correct position
      if colour == @code_array[index]
        correct_positions += 1
      # find number of colours in incorrect position
      elsif @code_array.include?(colour) && guess.colour_occurances[colour] < @colour_occurances[colour]
        incorrect_positions += 1
      end
    end

    Hint.new(correct_positions, incorrect_positions)
  end

  def self.colours
    @@colours
  end

  def self.possible_colours
    # Returns a coloured string representation of the possible colours

    colour_string = ''
    colour_array = @@colours
    colour_array.insert(-2, "and ")

    colour_array.each do |colour|
      if colour == "and "
        colour_string.delete_suffix!(', ')
        colour_string += " #{colour}"
      else
        colour_string += "#{colour.send(colour.to_sym)}, "
      end
    end

    colour_string.delete_suffix!(', ')
    colour_string
  end

  def self.is_valid?(code_array)
    valid = true
    code_array.each do |word|
      valid = false unless @@colours.include?(word)
    end
    valid
  end

end