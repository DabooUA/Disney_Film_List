require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './film.rb'

class DisneyFilmsList::Scraper

    def self.get_films
        
        doc = Nokogiri::HTML(open("https://d23.com/list-of-disney-films/"))
        doc.css(".site-main .entry-content a[title]").each do |row| 
            #anchor_tags = row.css("a").each do |anchor_tag|  
                film_name = row.attribute("title").value
                #binding.pry
                film_href = row.attribute("href").value     
                #puts film_name
                #puts film_href
                #puts self.get_film_bio(film_href)
                self.get_film_bio(film_href)
                #break
                DisneyFilmsList::Film.new(film_name, film_href)
        end
      
    end

    def self.get_film_bio(href)
        doc = Nokogiri::HTML(open("https://d23.com/a-to-z/#{href}/"))
        biography = doc.css('.entry-content').text.strip
        #DisneyFilmsList::Film.new(biography)
    end
 
end

#DisneyFilmsList::Scraper.get_films