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
            ask_user_film_choice
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

    def ask_user_film_choice
        #ask user for choice
        puts "Enter the number of the film you would like to know more about"
        index = gets.strip.to_i - 1

        #checks if index is valid (must be b/w 0 and 20)
        until index.between?(0, Film.all.length - 1)
            #keeps asking for user input until valid
            puts "Invalid number. Please choose a valid number"
            index = gets.strip.to_i - 1
        end
        
        film_instance = Film.all[index]
        
        #need to display the film choice
        display_film_information(film_instance)
    end

    def display_film_information(film)
        #you want to display attributes of film
        sleep(1)
        puts "\n"
        puts "Title: #{film.title}"
        puts "Description: #{film.description}"
        puts "Release Date: #{film.release_date}"
        puts "Rotten Tomato Score: #{film.rt_score}"
        puts "Director: #{film.director}"
        puts "Producer: #{film.producer}"
    end

end