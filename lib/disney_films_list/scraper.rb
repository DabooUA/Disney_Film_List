require 'nokogiri'
require 'open-uri'
require 'pry'

class DisneyFilmsList::Scraper

    def self.get_films
        site = "https://d23.com/list-of-disney-films/"
        doc = Nokogiri::HTML(open(site))
        doc.css(".site-main").each do |row| 
        name = row.css('.entry-content p').text.strip.gsub(/\b$\b/, ' (NR)').split("\n") [1..750]
        link = row.css('.entry-content p a').map { |anchor| anchor["href"]}
        DisneyFilmsList::Film.new(name, link)
        end
      
    end

end

DisneyFilmsList::Scraper.get_films