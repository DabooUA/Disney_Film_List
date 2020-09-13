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
                new_href = film_href.sub("https://d23.com/", "") 

                DisneyFilmsList::Film.new(film_name, new_href)
        end
    end
                
    def self.get_film_bio(href)
        doc = Nokogiri::HTML(open("https://d23.com/#{href}/"))
        doc.css('.entry-content').text.strip
    end
 
end

DisneyFilmsList::Scraper.get_films
