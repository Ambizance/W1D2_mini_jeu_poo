require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry

# player2 = Player.new("Joël")
# player1 = Player.new("Léo")
# puts "Voici l'état de chaque joueur : \n #{player1.show_state} \n  et  #{player2.show_state}"
# puts "\n \n READYYYYYY ?       FIGHT \n \n"

# while player1.life_point > 0 && player2.life_point > 0 do 
#     player2.attacks(player1)
#     puts player1.show_state
#     puts ""
#     break if player1.life_point <= 0
#     player1.attacks(player2)
#     puts player2.show_state
#     puts ""
# end




