require_relative './scraper.rb'
require_relative './film.rb'

class DisneyFilmsList::CLI
    
    def start
        
        puts "Welcome to complete list of Disney films all the way from 1937 to must recent releases! \n"

        DisneyFilmsList::Scraper.get_films
        # DisneyFilmsList::Film.all.each do |film|
        #     puts "#{film.name}\n"
            
            puts "Please select film to learn more about it: "
            input = gets.strip
            link = input.chomp
        end
    end
end

DisneyFilmsList::CLI.new.start