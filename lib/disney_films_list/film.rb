

class DisneyFilmsList::Film
    
    attr_reader :film_name, :film_href 
    #:biography

    @@all = []

    def initialize (film_name, film_href)
      @film_name = film_name
      @film_href = film_href
      #@biography = biography
      self.save

    end

    def save
        @@all<<self
    end

    def self.all
        @@all
    end
  
end