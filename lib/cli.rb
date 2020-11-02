class CLI

    def start
        puts "\n"
        puts "Welcome to The Ghibli Collection!"
        puts "\n"
        API.get_films
        self.directory
    end

    def directory
        puts "Would you like to see the collection of Studio Ghibli films?"
        puts "Type 'yes' or 'y' to continue or type any other key to exit"

        user_input = gets.strip.downcase 

        if user_input == "yes" || user_input == "y"
            puts "\n"
            puts "Good choice! Ready to become a Studio Ghibli fanatic?"
            puts "\n"
            sleep(1)

            puts "----------The Studio Ghibli film collection----------"
            display_list_of_films
            ask_user_filter_options
            ask_user_film_choice

            sleep(1)
            self.directory

        else
            sleep(1)
            puts "\n"
            puts "Goodbye for now! Happy watching!"
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
        Film.all.each.with_index(1) do |film, index|
            puts "#{index}. #{film.title}"
        end
    end

    def ask_user_film_choice
        puts "\n"
        puts "Which film would you like to know more about? Please enter the number associated"
        index = gets.strip.to_i - 1

        until index.between?(0, Film.all.length - 1)
            puts "Oh no! Looks like you've entered an invalid number. Please select a valid number"
            index = gets.strip.to_i - 1
        end

        if @filter == "no filter"
            film_instance = Film.all[index]
        elsif @filter == "rotten"
            film_instance = Film.sort_by_rt_score[index]
        else 
            film_instance = Film.sort_by_release_date[index]
        end

        display_film_information(film_instance)
    end

    def display_film_information(film)
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

    def ask_user_filter_options
        puts "\n"
        puts "Would you like to see the list using a filter? Enter 'yes' or 'no'"
        user_input = gets.strip.downcase

        until user_input == 'yes' || user_input =='no'
            puts "Sorry, I don't understand. Please enter 'yes' or 'no'"
            user_input = gets.strip.downcase
        end

        if user_input == 'yes'
            ask_user_sort_by_rt_score_or_release_date
        else
            puts "Okay, lets continue!"
            @filter = "no filter"
        end
    end

    def ask_user_sort_by_rt_score_or_release_date
        puts "\n"
        puts "Don't worry, we got you!! Would you like to sort by rotten tomato score or release date?"
        puts "Enter 'rt score' to sort by rotten tomato score or 'date' to sort by release date"

        user_input = gets.strip.downcase
        puts "\n"

        until user_input == 'rt score' || user_input =='date'
            puts "Sorry, I don't understand. Please enter 'rt score' or 'date'"
            user_input = gets.strip.downcase
        end

        if user_input == 'rt score'
            sleep(1)
            puts "----------Studio Ghibli Films Ranked from Highest to Lowest Rotten Tomato Score----------"
            display_sorted_films_by_rt_score
            @filter = "rotten"
            puts "\n"
        else
            sleep(1)
            puts "----------Studio Ghibli Films Ranked from Most Recent to Oldest Film----------"
            display_sorted_films_by_release_date
            @filter = ""
            puts "\n"
        end
    end

    def display_sorted_films_by_rt_score
        Film.sort_by_rt_score.map.with_index(1) do |film, index|
            puts "#{index}. #{film.title} 🍅 #{film.rt_score}%"
        end
    end

    def display_sorted_films_by_release_date
        Film.sort_by_release_date.map.with_index(1) do |film, index|
            puts "#{index}. #{film.title} (#{film.release_date})"
        end 
    end 

end