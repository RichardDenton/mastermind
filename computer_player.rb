class Computer_Player < Player

  def set_code
    code = []
    4.times do
      code.push(Code.colours.sample)
    end
    Code.new(code)
  end

  def break_code
    nil
  end

end