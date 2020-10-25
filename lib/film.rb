class Film
    
    attr_accessor :title, :description, :director, :producer, :release_date, :rt_score

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def sort_by_rt_score
        #want to sort through the list of films by the rotten tomato score
        Film.all.sort_by {|film| -film.rt_score.to_i}
    end
end