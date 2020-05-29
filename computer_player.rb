class Computer_Player < Player

  def set_code
    Player.colours.sample(4).join
  end

  def break_code
    nil
  end

end