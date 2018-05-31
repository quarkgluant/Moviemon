require 'uri'
# require 'json'
require 'net/http'

class GameSession

  LIST_MOVIES = [
      'Julieta',
      'Reality',
      'The Voices',
      'Drunken Master',
      'Mommy',
      'Sharknado',
      'Gunday',
      'Razorback',
      'Alone in the Dark',
      'Left Behind',
      'Saving Christmas',
      'Monster High: Welcome to Monster High',
      'Money Monster',
      'The Naked Monster',
      'Seamonsters',
      'Adventures of Petey and Friends',
      'Alien',
      'Prometheus',
      'Dune',
      'Monster a-Go Go',
      "Manos: The Hands of Fate",
      "Birdemic: Shock and Terror",
      "Disaster Movie",
      "Zombie Nation"
  ]

  def initialize
  end

  def save
    unless File.exist?("public/save.json")
      File.open("public/save.json", "w+") do |f|
        tab = [{}, {}, {}]
        tab[$player[:slot] - 1] = $player
        f.write(JSON.pretty_generate(tab))
      end
    else
      tab = JSON.parse(File.read("public/save.json"))
      File.open("public/save.json", "w+") do |f|
        tab[$player[:slot] - 1] = $player
        f.write(JSON.pretty_generate(tab))
      end
    end
  end

  def load
    file = File.read("public/save.json")
    data_hash = JSON.parse(file, :symbolize_names => true)
    $player = data_hash[$player[:slot] - 1]
  end


  def get_movie
    @my_movies = []
    # 30.times {@my_movies << JSON.parse(Net::HTTP.get(URI("http://www.omdbapi.com/apikey=3ed681f6")))}
    LIST_MOVIES.each { |title| @my_movies << JSON.parse(Net::HTTP.get(URI("http://www.omdbapi.com/?t=#{title.tr(' ', '_')}&apikey=3ed681f6"))) }
    @my_moviemons = []
    puts @my_movies
    @my_movies.each do |movie|
      @my_moviemons << {
          title: movie["Title"],
          year: movie["Year"],
          director: movie["Director"],
          genre: movie["Genre"],
          rating: movie["Ratings"][0]["Value"],
          poster: movie["Poster"],
          synopsis: movie["Plot"],
          strength: movie["Ratings"][0]["Value"].to_i,
          life: movie["Ratings"][0]["Value"].to_i * 2
      }
    end
    @my_moviemons
  end

end