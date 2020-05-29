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
    @code_breaker.break_code
  end
end