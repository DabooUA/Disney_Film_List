require 'nokogiri'
require 'open-uri'
require 'pry'

#require_relative './film.rb'

class DisneyFilmsList::Scraper

    def self.get_films
        #site = "https://d23.com/list-of-disney-films/"
        doc = Nokogiri::HTML(open("https://d23.com/list-of-disney-films/"))
        doc.css(".site-main").each do |row, index| 
        name = row.css("div.entry-content").text.strip.gsub(/\b$\b/, ' (NR)').split("\n") [1..750]
        #name.reject {|r| r.to_s.all?(&:nil?)}
        link = row.css("div.entry-content a").attribute("href").value
        link.strip.split("\n") [1..750]
        #link = row.css('.entry-content a').collect { |anchor| anchor["href"]}
        binding.pry
       
        #DisneyFilmsList::Film.new(index, name, link)
        end
      
    end

    def self.get_film_bio(bio)
        doc = Nokogiri::HTML(open("https://d23.com/a-to-z/"))
        doc.css('.main.site-main').text.strip

    end

end

DisneyFilmsList::Scraper.get_films