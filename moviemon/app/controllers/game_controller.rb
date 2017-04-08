class GameController < ApplicationController
	$view = 'loading'
#	$selected =
#	$game = 
#	$player =

	def loading
	end

	def shutdown
	end

	def power
		if $view == 'shutdown'
			$view = 'loading'
			redirect_to loading_path
		else
			$view = 'shutdown'
			redirect_to shutdown_path
		end
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
