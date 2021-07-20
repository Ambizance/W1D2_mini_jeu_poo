class Player
    attr_accessor :name, :life_point

    def initialize(name)
        @name = name
        @life_point = 10
    end

    def show_state
        puts "#{@name} a #{@life_point} point de vie"
    end

    def gets_damage(damage)
        @life_point = @life_point - damage
            if @life_point <= 0
                puts  "#{@name} a été tué !"
            else
                puts "#{@name} a subi #{damage} dégats"
            end
    end

    def attacks(opponent)
        puts "#{@name} attaque #{opponent.name} "
        damage = compute_damage
        opponent.gets_damage(damage)     
    end

    def compute_damage
        return rand(1..6)
    end

end

class HumanPlayer < Player
attr_accessor :weapon_level

    def initialize(name)
        super(name) #fait appel au initialize de la classe Event
        @life_point=100
        @weapon_level = 1
    end

    def show_state
       puts  "#{@name} a #{@life_point} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon 
       new_weapon_level = rand(1..6)
       puts "Tu as trouvé une arme de niveau #{new_weapon_level}"

       if new_weapon_level > @weapon_level
        @weapon_level = new_weapon_level
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
       else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
       end
    end

    def search_health_pack
        finder = rand(1..6)
        if finder == 1 
            puts "Tu n'as rien trouvé... "
        elsif finder.between?(2, 5)
            @life_point += 50
            @life_point=@life_point.clamp(0, 100)
            puts "Bravo, tu as trouvé un pack de +50 points de vie ! Ta vie est maintenant de #{@life_point}"
        elsif finder == 6
            @life_point += 80
            @life_point=@life_point.clamp(0, 100)
            puts "Waow, tu as trouvé un pack de +80 points de vie ! Ta vie est maintenant de #{@life_point}"
        end
    end

end

