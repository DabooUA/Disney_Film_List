require_relative './scraper.rb'
require_relative './film.rb'
require 'pry'

class DisneyFilmsList::CLI
    
    def start
        
        puts "Welcome to complete list of Disney films all the way from 1937 to must recent releases! \n"
        
        list_films
        input = ''
        #DisneyFilmsList::Scraper.get_films
        #binding.pry
            puts "---------------------------------------------------------------------------------------"       
            puts "Please select film to learn more about it: "
           # puts film_name
            
            input = gets.strip
            #biography = input.chomp
            if input.to_i > 0 && input.to_i <= DisneyFilmsList::Film.all.length
                film = DisneyFilmsList::Film.all[input.to_i - 1]
                DisneyFilmsList::Scraper.get_film_bio(href)
                puts href.biography
            elsif input == 'list'
                list_films
            # elsif input == 'exit'
            #     break
            else 
                puts 'Invalid input'
            end
        
    end

    def list_films
        DisneyFilmsList::Film.all.each do |f|
            puts "#{f.film_name}"
            #binding.pry
        end
    end
end



DisneyFilmsList::CLI.new.start