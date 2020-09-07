require_relative './scraper.rb'
require_relative './film.rb'
require 'pry'

class DisneyFilmsList::CLI
    
    def start
        
        puts "Welcome to complete list of Disney films all the way from 1937 to must recent releases! \n"
        
        list_films
        
        input = ''
        
            puts "---------------------------------------------------------------------------------------"       
            puts "Please select film to learn more about it: "
            
            input = gets.strip
            #biography = input.chomp
            if input.to_i > 0 && input.to_i <= DisneyFilmsList::Film.all.length
                film = DisneyFilmsList::Film.all[input.to_i - 1]
                link = DisneyFilmsList::Scraper.get_film_bio(film.film_href)
                puts "#{link}"
            elsif input == 'list'
                list_films
            else 
                puts 'Invalid input, please try again.'
             end
        
    end

    def list_films
        DisneyFilmsList::Film.all.each_with_index do |f, index|
            puts "#{index + 1}. #{f.film_name}"
            
        end
    end
end



DisneyFilmsList::CLI.new.start