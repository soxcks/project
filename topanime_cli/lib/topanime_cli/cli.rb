class TopanimeCli::CLI 
    
    def run
        system("clear")
        greeting
        API.get_data
        menu
    end

    def greeting
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ: *✧･ﾟ:*✧･ﾟ: *✧･ﾟ:*✧"
        puts "Welcome to the Top 50 Anime List!"
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ: *✧･ﾟ:*✧･ﾟ: *✧･ﾟ:*✧"
    end

    def menu
        puts " "
        puts "**********"
        puts "Options:"
        puts "'List'"
        puts "'Exit'"
        puts "*********"
        input = gets.strip.downcase

        if input == "list"
            anime_list
        elsif input == "exit"
            exit
        else
            puts " "
            puts "**error, try again**"
            menu
        end
    end

    def menutwo
        puts " "
        puts "**keep Learning about the Top Anime?**(y/n)"
        
        input = gets.strip.downcase

        if input == "y"
            anime_list
        elsif input == "n"
            exit
        else
            puts "error"
            menutwo
        end
    end

    def anime_list
        puts " "
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ*✧"
        puts "Select Anime:"
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ*✧"
        Anime.all.each.with_index(1) do |anime, index|
            puts "#{index}. #{anime.title}"
        end
        puts "*******************"
        input = gets.strip.downcase
        selecting_anime(input)
    end

    def selecting_anime(anime)
        show = Anime.find_by_name(anime)
        show.each do |s|
            puts " "
            puts "*****************"
            puts "~ Good Choice ~"
            puts "Rank: #{s.rank}"  
            puts "Title: #{s.title}"
            puts "Episodes: #{s.episodes}"
            puts "Start Date: #{s.start_date}"
            puts "End Date: #{s.end_date}"
            puts "Score: #{s.score}"
            puts "*****************"
            
            menutwo
        end

    end

    def exit
        puts " "
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ: *✧･ﾟ:*✧･ﾟ✧･ﾟ:*✧"
        puts "~ We hope to see you again! ~"
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ: *✧･ﾟ:*✧･ﾟ✧･ﾟ:*✧"
    end

    
end