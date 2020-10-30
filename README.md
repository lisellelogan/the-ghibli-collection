# The Ghibli Collection

## Description
The Ghibli Collection was inspired by IMDb and created with hopes of easily allowing someone to see a short description of a Studio Ghibli film.

This app allows the user to choose from a collection of Studio Ghibli films and give information about the title, movie description, director, producer, release date, and most importantly, the rotten tomato score for each individual movie.

Through this information, the user will then be able to determine which film peaks their interest the most and slowly turn them into a Studio Ghibli fanatic. The Ghibli Collection uses the Studio Ghibli API from https://ghibliapi.herokuapp.com/ in order to provide a database of Studio Ghibli films.

The Ghibli Collection was written using Ruby.

## Usage
Begin by running the executable using "ruby bin/run"

The user will then be prompted with a greeting to the app and asked if the user would like to see the collection of Studio Ghibli films. The user would enter either "yes" or "y" to continue or the user can exit by entering any other key.

The list of Studio Ghibli films will be displayed with an associated number from 1-20 in the order in which they are displayed in the API.

The user will then be prompted with a question asking to filter through the list in which the user would enter "yes" or "no".
If the user enters "no" the app will proceed with the original display of the list of films and will be prompted to choose the number of the film that they would like to know more about.

If the user enters "yes" the app will proceed with prompting the user to choose between sorting the list of films by rotten tomato score or by release date. 

Once the user chooses which filter to use, the sorted list will be displayed in order from highest to lowest. The user will 

## Installation
To install this app, go to github to fork and clone this repository.


