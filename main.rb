require_relative 'colours'
require_relative 'player'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'game'
require_relative 'code'
require_relative 'hint'

def select_game_type
  system("clear")
  puts "MASTERMIND".center(30).cyan
  puts
  puts "Please select from the below:".green
  puts
  puts "1. Play as the code breaker"
  puts "2. Play as the code setter"
  puts
  print "note: ".red
  puts "The computer player uses Donald Knuth's five-guess algorithm"
  puts "      and should be able to crack any code in a maximum of five turns"

  choice = nil
  until choice == "1" || choice == "2" do
    print ": "
    choice = gets.chomp
    puts "Please enter 1 or 2" unless choice == '1' || choice == '2'
  end

  case choice
  when '1'
    player_role = 'breaker'
  when '2'
    player_role = 'setter'
  end

  Human_Player.new(player_role)
end

def play_game(keep_playing = true)
  while keep_playing
    game = Game.new(select_game_type)
    keep_playing = game.play
  end
end

play_game