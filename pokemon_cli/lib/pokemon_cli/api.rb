class API

    def self.get_data
        rest = RestClient.get("https://pokeapi.co/api/v2/pokemon/")
        pokemon_array = JSON.parse(rest.body)["results"]
        pokemon_array.each do |pokemon|
             Pokemon.new(pokemon)
        
        end
    end
end

