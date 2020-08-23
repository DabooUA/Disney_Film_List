require 'nokogiri'
require 'open-uri'
require 'pry'

class DisneyFilmsList::Scraper

    def self.get_films
        site = "https://d23.com/list-of-disney-films/"
        doc = Nokogiri::HTML(open(site))
        doc.css(".entry-content").each do |row| 
        puts row.css('p').text.strip.gsub(/\b$\b/, ' (NR)').split("\n") [1..750]
               
        binding.pry 
       
        end
      
    end

end

DisneyFilmsList::Scraper.get_films