class Anime
    attr_accessor :rank, :title, :url, :episodes, :start_date, :end_date, :score, :mal_id

    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |k,v|
            self.send("#{k}=", v) if self.respond_to? ("#{k}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(title)
        self.all.select do |anime|
            anime.title.downcase == title
        end
    end
end