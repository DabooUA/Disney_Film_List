class DisneyFilmsList::CLI
    
    def start
        DisneyFilmsList::Scraper.get_films
        DisneyFilmsList::Film.all.each do |film|
            puts "#{name.name}, Film bio #{link.link}"
        end
    end
end

DisneyFilmsList::CLI.new.start