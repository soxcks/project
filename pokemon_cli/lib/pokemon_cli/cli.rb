class PokemonCli::CLI 
    
    def run
        system("clear")
        greeting
        API.get_data
        menu
    end

    def greeting
        puts "Welcome to the Pokédex!"
    end

    def menu
        puts " "
        puts "Options:"
        puts "'Pokedex'"
        puts "'Exit'"
        input = gets.strip.downcase

        if input == "pokedex"
            pokemon_list
        elsif input == "exit"
            exit
        else
            puts "**Error, try again**"
            menu
        end
    end

    def menutwo
        puts "Keep Learning about Pokemon?(y/n)"
        
        input = gets.strip.downcase

        if input == "y"
            pokemon_list
        elsif input == "n"
            exit
        else
            puts "error"
            menutwo
        end
    end

    def pokemon_list
        puts " "
        puts "Select Pokemon:"
        puts "*******************"
        Pokemon.all.each.with_index(1) do |pokemon, index|
            puts "#{index}. #{pokemon.name}"
        end
        puts "*******************"
        input = gets.strip.downcase
        selecting_pokemon(input)
    end

    def selecting_pokemon(pokemon)
        monster = Pokemon.find_by_name(pokemon)
        monster.each do |s|
            puts " "
            puts "~ Good Choice ~"
            a = "Index: #{s.url}"
            a.slice! "https://pokeapi.co/api/v2/pokemon/".chomp("/")
            puts a  
            puts "Name: #{s.name.upcase}"
            puts "*******************"
            
            menutwo
        end

    end

    def exit
        puts " "
        puts "~ We hope to see you again! ~"
    end

    
end