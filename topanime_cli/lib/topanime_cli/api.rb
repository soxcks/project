class API

    def get_data
        rest = RestClient.get("https://api.jikan.moe/v3/top/anime/1")
        anime_array = JSON.parse(rest.body)["top"]
        anime_array.each do |anime|
             Anime.new(anime)
        end
    end
end

