class Film
    
    attr_accessor :title, :description, :director, :producer, :release_date, :rt_score

    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.sort_by_rt_score
        Film.all.sort_by {|film| -film.rt_score.to_i}
    end

    def self.sort_by_release_date
        Film.all.sort_by {|film| -film.release_date.to_i}
    end

end