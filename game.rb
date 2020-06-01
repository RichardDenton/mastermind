class Game
  def initialize(player)
    case player.role
    when "breaker"
      @code_breaker = player
      @code_setter = Computer_Player.new('setter')
    when "setter"
      @code_breaker = Computer_Player.new('breaker')
      @code_setter = player
    end 
  end

  def play
    @code = @code_setter.set_code

    hints = nil
    guesses = 0
    code_broken = false

    until guesses == 12 || code_broken do
      guess = @code_breaker.get_guess(guesses, hints)
      puts guess
      code_broken = @code.code_cracked?(guess)
      guesses += 1
      hints = @code.get_hints(guess)
    end

    @code_breaker.end_attempt(code_broken, @code)
  end
end