

class DisneyFilmsList::Film
    attr_accessor :biography
    attr_reader :name, :link

    @@all = []

    def initialize (name, link)
      @name = name
      @link = link
      @biography = "Sorry no biography available for this film."
     self.save

    end

    def save
        @@all<<self
    end

    def self.all
        @@all
    end
  
end