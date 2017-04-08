class GameController < ApplicationController
	$view = 'loading'
#	$selected =
#	$game = 
#	$player =

	def loading
	end

	def power
		puts "hello"
		$view = $view == 'shutdown' ? 'loading' : 'shutdown'
		puts $view
		redirect_to shutdown_path
	end

	def buttonA
	end

	def buttonB
	end

	def select
	end

	def start
	end

	def arrows(input)
	end
end
