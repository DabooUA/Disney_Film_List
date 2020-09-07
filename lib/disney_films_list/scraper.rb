require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './film.rb'

class DisneyFilmsList::Scraper

    def self.get_films
    
        doc = Nokogiri::HTML(open("https://d23.com/list-of-disney-films/"))
        doc.css(".site-main .entry-content a").each do |row|  
                film_name = row.text
                if film_name == "here"
                    next
                end
                film_href = row.attribute("href").value     
                DisneyFilmsList::Film.new(film_name, film_href)
        end
    end
                # self.get_film_bio(film_href)
    def self.get_film_bio(href)
        doc = Nokogiri::HTML(open("https://d23.com/a-to-z/#{href}/"))
        doc.css('.entry-content').text.strip
    end
 
end

DisneyFilmsList::Scraper.get_films
