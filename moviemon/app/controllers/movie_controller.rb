class MovieController < ApplicationController

  def get_my_movies

    @my_movies = []
    20.times {@my_movies << JSON.parse(Net::HTTP.get(URI('https://random-movie.herokuapp.com/random'))) }
    @my_moviemons = []
    @my_movies.each{|movie| @my_moviemons << Movie.new(movie)}
  end


end
