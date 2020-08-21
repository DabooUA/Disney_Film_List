require 'nokogiri'
require 'open-uri'
require 'pry'

class DisneyFilmsList::Scraper

    def self.get_films
        doc = Nokogiri::HTML(open(https://d23.com/list-of-disney-films/))
        doc.css(".entry-content").each.with_index(1) do |row|
        puts row.css('p').text.strip.split("\n")
        binding.pry 

        end

    end

end

DisneyFilmsList::Scraper.get_films