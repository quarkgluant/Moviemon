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

	def get_movie
	end
end