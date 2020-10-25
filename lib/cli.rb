class CLI

    def start
        puts "\n"
        puts "Welcome to The Ghibli Collection!"
        puts "\n"
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
            puts "\n"
            sleep(1)
            #show list of films
            puts "The Studio Ghibli film collection:"
            display_list_of_films
            ask_user_film_choice
            
            sleep(1)
            #want to go back and ask user if they want to see films (recursion)
            self.directory
        else
            sleep(1)
            puts "\n"
            puts "Goodbye for now. Happy watching!"
            puts """
            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@@@@@@@&     .@@@@@@@@@@@@%     /@@@@@@@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@@@@@&    @&    @@@@@@@@(   ,@(   .@@@@@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@@@#    @@((@%  .&@@@@@(   @&(#@/    @@@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@@.   @@(((((#@(  @@@@,  @@(/(((%@,   %@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@%  %@(((((((#@(   .%    @@/((((((@@  .@@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@&   %@((((((((/#@/  ,  @@(((((((((@@   ,@@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@  (@#(((((((((/#@/  ,  @@(((((((((((@@  ,@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@  (@#((((((((((#@/     @@(((((((((((@@  ,@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@  ,/#%((((((((((/#%%%%%(((((((((((%%//  ,@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@,   (@#(((((((((((((((((((((((((((((((@@    &@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@(  *@#(((((((((((((((((((((((((((((((((//@@    &@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@&   ,&%(((. %&&& .((((((((((((((((* *&&&, //((@&   .@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@   @&(((((. @@@@  (((((&@@@@@(((((* /@@@, /(((((@%  #@@@@@@@@@@@@@
            @@@@@@@@@@@@@/   @&(((////    ((((((((/&@(((((((((*   *///((((@%    @@@@@@@@@@@@
            @@@@@@@@@@@@,  @@(((((/(/((((((((((((((((((((((((((((((///(((((#@#  &@@@@@@@@@@@
            @@@@@@@@@@#    @@((((((((((((((((((((((((((((((((((((((((((((((#@#   .@@@@@@@@@@
            @@@@@@@@@/   @@/(((((((((((((((((((((((((((((((((((((((((((((((((%@/   @@@@@@@@@
            @@@@@@@@(  @@(/(/((((((((((((((/,,,,,,,,,,,,,,,,*((((((((((((((((((%@,  @@@@@@@@
            @@@@@@@    @@(((((((((((((((,,,,,,,,,,,,,,,,,,,,,,,,*((((((((((((((%@,   *@@@@@@
            @@@@@/   %@(((((((((((((((,,,,,,,,,,,*//(//,,,,,,,,,,,/((((((((((((((&@    @@@@@
            @@@@&  #@(((/((((/(/((((,,,,,,,,,,,*/*,,,,,((,,,,,,,,,,,/(((((/((((((((@@  .@@@@
            @@@@&  (@#/((((/(@&(((((*,,,/(((,,,,,,,,,,,,,,,,,(((*,,,/(((((@&(((((((@@  .@@@@
            @@@@&  (@#/((((@@(((((*,,,/(,,,,,,,,,,,,,,,,,,,,,,,,*(,,,,(((((#@&(((((@@  .@@@@
            @@@@@    %@@@@@(((((*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,(((((%@@@@@    %@@@@
            @@@@@@@.       @@(((*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,(((#@(       %@@@@@@
            @@@@@@@@@@@@(   .@&/*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,((@%    @@@@@@@@@@@@
            @@@@@@@@@@@@@@   @&(*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,((@%  #@@@@@@@@@@@@@
            @@@@@@@@@@@@@@&   .#((*,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,((#(   ,@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@%    (@@@,,,,,,,,,,,,,,,,,,,,,,,,,,,,&@@@    *@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@.     @@@@@@@@@@@@@@@@@@@@@@@@@@@@,     &@@@@@@@@@@@@@@@@@@@
            @@@@@@@@@@@@@@@@@@@@@@@@/                               @@@@@@@@@@@@@@@@@@@@@@@@
            """

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
        puts "\n"
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
        puts "#{film.title}" + " (#{film.release_date})"
        puts "Description: #{film.description}"
        # puts "Release Date: #{film.release_date}"
        puts "Rotten Tomato Score: #{film.rt_score}"
        puts "Director: #{film.director}"
        puts "Producer: #{film.producer}"
        puts "\n"
    end

end