class CLI

    def start
        puts "Welcome to The Ghibli Collection!"
        API.get_films
        self.directory
    end

    #want to list out all the films
    #allow user to choose a film and get info on that film

    def directory
        #giver user ability to see list of films
        #prompt user for input
        puts "Would you like to see the collection of Studio Ghibli films?"
        puts "Type 'yes' or 'y' to continue or type any other key to exit"
        
        user_input = gets.strip.downcase

        #if user says yes
        if user_input == "yes" || user_input == "y"
            puts "You chose well!"
            #show list of films
            display_list_of_films
        else
            #exit
        end
    end

    def display_list_of_films
        #access all films
        #print each film out
        Film.all.each.with_index(1) do |film, index|
            puts "#{index}. #{film.title}"
        end
    end

end