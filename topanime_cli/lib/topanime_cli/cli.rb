class TopanimeCli::CLI 
    
    def run
        system("clear")
        greeting
        API.new.get_data
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
    
    def anime_list
        puts " "
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ*✧"
        puts "Select Anime:"
        puts "✧･ﾟ: *✧･ﾟ:*✧･ﾟ*✧"
        Anime.all.each.with_index(1) do |anime, index|
            puts "#{index}. #{anime.title}"
        end
        puts "*******************"
        select_anime
    end

    

    def select_anime
        
        input = gets.strip.downcase
       
        if input == anime_info(input)
            anime_info
        elsif input == "exit"
            exit
        
        else input.to_i >= 0 && input.to_i <= Anime.all.length
            anime = Anime.all[input.to_i - 1]
            anime_info_index(anime)
        
        end
        
    end
    
    def anime_info(anime)
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
    
    def anime_info_index(anime)
        puts " "
        puts "*****************"
        puts "~ Good Choice ~"
        puts "Rank: #{anime.rank}"  
        puts "Title: #{anime.title}"
        puts "Episodes: #{anime.episodes}"
        puts "Start Date: #{anime.start_date}"
        puts "End Date: #{anime.end_date}"
        puts "Score: #{anime.score}"
        puts "*****************"
        menutwo
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
            puts "**error, try again**"
            menutwo
        end
    end

    def exit
        abort("~ We hope to see you again! ~")
    end

end