class Film

attr_reader :name, :link

@@all = []

    def initialize (name, link)
      @name = name
      @link = link
     self.save

    end

    def save
        @@all<<self
    end

    def self.all
        @@all
    end

end