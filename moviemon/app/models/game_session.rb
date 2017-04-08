require 'uri'
require 'json'
require 'net/http'

class GameSession

	def initialize
	end

	def save
		data_hash = $player
		File.open("public/save.json", "w") do |f|
			f.write(JSON.pretty_generate(data_hash))
		end
	end

	def load
		file = File.read("public/save.json")
		data_hash = JSON.parse(file)
		$player = data_hash['player']
	end
 	
 	private

	def get_movie
	end

  def get_my_movies
    @my_movies = []
    20.times {@my_movies << JSON.parse(Net::HTTP.get(URI('https://random-movie.herokuapp.com/random'))) }
    @my_moviemons = []
    @my_movies.each{|movie| @my_moviemons << Movie.new(movie)}
    @my_moviemons
  end

end