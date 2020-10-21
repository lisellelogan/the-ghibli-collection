class CLI

    def start
        puts "Welcome to The Ghibli Collection!"
        API.get_films
    end

end