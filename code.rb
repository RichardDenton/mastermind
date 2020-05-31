class Code
  attr_reader :code_array

  @@colours = ['red', 'green', 'blue', 'magenta', 'cyan', 'brown']

  def initialize(code_array)
    @code_array = code_array
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