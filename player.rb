class Player
  attr_reader :role

  def initialize (role)
    @role = role
  end

  def play_again?
    puts
    print "Would you like to play again? (y/n): "
    play_again = nil
    until play_again == "y" or play_again == "n"
      play_again = gets.chomp.downcase
      unless play_again == "y" || play_again == "n"
        print "Please only enter y or n: "
      end
    end
    play_again == 'y' ? true : false
  end
  
end