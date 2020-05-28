class Game
  attr_reader :player, :computer, :code_breaker, :code_setter

  def initialize
    @player = create_player
    @computer = Computer_Player.new('Computer', @player.role == 'breaker' ? 'setter' : 'breaker')
    
    case @player.role
    when 'breaker'
      @code_breaker = @player
      @code_setter = @computer
    when 'setter'
      @code_breaker = @computer
      @code_setter = @player
    end
  end

  private
  def create_player
    puts
    puts "Mastermind"
    puts "----------"
    puts 
    print "Hello, what is your name? "
    name = gets.chomp
    puts
    puts "Please select an option #{name}:"
    puts "1. Play as the code breaker."
    puts "2. Play as the code setter."
    puts

    choice = nil
    until choice == '1' || choice == '2' do
      print "(1 or 2)? "
      choice=gets.chomp
      choice == '1' ? role = 'breaker' : role = 'setter'
    end

    Human_Player.new(name, role)
  end
end