class API

    def self.get_films
        url = "https://ghibliapi.herokuapp.com/films"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        array_of_films = JSON.parse(response)
        
        array_of_films.each do |film_hash|
            film = Film.new
            film.title = film_hash["title"]
            film.description = film_hash["description"]
            film.director = film_hash["director"]
            film.producer = film_hash["producer"]
            film.release_date = film_hash["release_date"]
            film.rt_score = film_hash["rt_score"]
        end
    end

end