class CLI

    def start
        puts "\n"
        puts "Welcome to The Ghibli Collection!"
        puts "\n"
        API.get_films
        self.directory
    end

    def directory
        #giver user ability to see list of films
        #prompt user for input
        puts "Would you like to see the collection of Studio Ghibli films?"
        puts "Type 'yes' or 'y' to continue or type any other key to exit"

        user_input = gets.strip.downcase

        if user_input == "yes" || user_input == "y"
            puts "\n"
            puts "Good choice! Ready to become a Studio Ghibli fanatic?"
            puts "\n"
            sleep(2)

            puts "----------The Studio Ghibli film collection----------"
            display_list_of_films
            if ask_user_filter_options
                sleep(1)
                self.directory
            else ask_user_film_choice
                sleep(1)
                self.directory
            end

            # sleep(1)
            # self.directory
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

    def ask_user_filter_options
        #ask the user if want to sort by rt_score or release_date
        puts "\n"
        puts "Feeling overwhelmed? Enter 'yes' or 'no'"
        user_input = gets.strip.downcase

        until user_input == 'yes' || user_input =='no'
            puts "Sorry, I don't understand. Please enter 'yes' or 'no'"
            user_input = gets.strip.downcase
        end

        if user_input == 'yes'
            ask_user_sort_by_rt_score_or_release_date
        else
            puts "Okay, lets continue!"
        end
    end

    def ask_user_sort_by_rt_score_or_release_date
        puts "Okay, would you like to sort by rotten tomato score or release date?"
        puts "Enter 'rt score' to sort by rotten tomato score or 'year' to sort by releate date"
        user_input = gets.strip.downcase
    end

    def ask_user_film_choice
        #ask user for choice
        puts "\n"
        puts "Which film would you like to know more about? Please enter the number associated"
        index = gets.strip.to_i - 1

        #checks if index is valid (must be b/w 0 and 20)
        until index.between?(0, Film.all.length - 1)
            #keeps asking for user input until valid
            puts "Oh no! Looks like you've entered an invalid number. Please select a valid number"
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
        puts "----------#{film.title}" + " (#{film.release_date})----------"
        puts "Description: #{film.description}"
        puts "\n"
        puts "Rotten Tomato Score: 🍅#{film.rt_score}%"
        puts "\n"
        puts "Director: #{film.director}"
        puts "Producer: #{film.producer}"
        puts "\n"
    end

end