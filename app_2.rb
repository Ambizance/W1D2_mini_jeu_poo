require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#message de bienvenu
puts "------------------------------------------------"
puts "Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

#Initialisation du joueur sous la variable nickname
puts "Quel est le nom du joueur ?"
print "> "
nickname = gets.chomp.to_s
player1 = HumanPlayer.new(nickname)

#Initialisation des ennemis 
array_enemies = []
enemy1 = Player.new("José") 
array_enemies << enemy1 
enemy2 = Player.new("Josiane")
array_enemies << enemy2

#Le combat
while ((enemy1.life_point > 0) || (enemy2.life_point > 0)) && (player1.life_point > 0)
    player1.show_state 

    #----------------------------------------------------------------
    gets.chomp #on marque un temps d'arrêt
    #----------------------------------------------------------------

    puts "Quelle action veux-tu effectuer ? \n"
    print "-------------------------------------"
    puts "\na - chercher une meilleure arme"
    puts "s - chercher à se soigner "

    puts "\n attaquer un joueur en vue :"

    print "\n0 - "
    print "#{enemy1.show_state}"
    print "1 - "
    print "#{enemy2.show_state}"
    puts "-------------------------------------"

    # la façon d'écrire ci-dessous ne renvoie pas ce que je veux
    # puts "\n 0 - attaquer #{enemy1.show_state}"
    # puts "1 - attaquer #{enemy2.show_state}"

    print "Choix > "
    choice = gets.chomp

    if choice == "a"
        player1.search_weapon
    elsif choice == "s"
        player1.search_health_pack
    elsif choice == "0"
        player1.attacks(enemy1)
    elsif choice == "1"
        player1.attacks(enemy2)
    else
        puts "#{choice} n'est pas une option"
    end



    break if (enemy1.life_point <= 0 && enemy2.life_point <= 0)
    break if (player1.life_point <= 0)

    #----------------------------------------------------------------
    gets.chomp #on marque un temps d'arrêt
    #----------------------------------------------------------------

    puts "Les autres joueurs t'attaquent !"
    array_enemies.each {|enemy| if enemy.life_point > 0 then enemy.attacks(player1) 
        
     #----------------------------------------------------------------
     gets.chomp #on marque un temps d'arrêt
     #----------------------------------------------------------------
    end } 
    

end

#fin du jeu
    if player1.life_point > 0 
        puts "BRAVO ! TU AS GAGNE !"
    elsif (enemy1.life_point > 0) || (enemy2.life_point > 0)
        puts "Loser ! Tu as perdu !"
    end
