class API

    def self.get_films
        url = "https://ghibliapi.herokuapp.com/films"
        binding.pry
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)

    end

end