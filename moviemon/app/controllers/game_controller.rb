class GameController < ApplicationController
  $view ||= 'title_screen'
# $selected =
# $game = 
# $player =

  def title_screen
  end

  def shutdown
  end

  def power
    if $view == 'shutdown'
      $view = 'title_screen'
      redirect_to title_screen_path
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
    case $view
    when "title_screen"
      $view = 'loading_game'
      redirect_to :"#{$view}"
    when "moviedex"
      $view = "world_map"
      redirect_to :"#{$view}"      
    when "world_map"
      $view = "saving_game"
      redirect_to :"#{$view}"      
    when "saving_game"
      $view = "world_map"
      redirect_to :"#{$view}"
    when "loading_game"
      $view = "title_screen"
      redirect_to :"#{$view}"
    else
      redirect_to :"#{$view}"
    end
  end

  def start
    case $view
    when "title_screen"
      $view = "world_map"
      redirect_to :"#{$view}"
    when "world_map", "battle"
      $view = "moviedex"
      redirect_to :"#{$view}"
    else
      redirect_to :"#{$view}"
    end
  end

  def arrows(input)

  end
end
