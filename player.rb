class Player
  @@colours = ['r', 'g', 'b', 'y', 'c', 'p']

  attr_reader :role

  def initialize (role)
    @role = role
  end

  def self.colours
    @@colours
  end
end