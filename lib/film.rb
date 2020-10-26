class Film
    
    attr_accessor :title, :description, :director, :producer, :release_date, :rt_score

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end
    
end