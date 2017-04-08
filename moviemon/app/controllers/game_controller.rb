#require '../models/game_sessions.rb'

class GameController < ApplicationController
  $view ||= 'title_screen'
# $selected =
# $game = 
  $player = {position: [0, 0], life: 20, strength: 5}

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
    case $view
    when "saving_game"
      GameSession.new.save
      redirect_to world_map_path
    end
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
      get_my_movies.inspect
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
    when "title_screen" #launch new game
      $player = {position: [0, 0], life: 20, strength: 5}
      $view = "world_map"
      redirect_to :"#{$view}"
    when "world_map", "battle"
      $view = "moviedex"
      redirect_to :"#{$view}"   
    else
      redirect_to :"#{$view}"
    end
  end

  def up
    $player[:position][1]
    $view = "world_map"
    redirect_to :"#{$view}"
  end

  def down
    $player[:position][1]
    $view = "world_map"
    redirect_to :"#{$view}"
  end

  def right
    $player[:position][0]
    $view = "world_map"
    redirect_to :"#{$view}"
  end

  def left
    $player[:position][0]
    $view = "world_map"
    redirect_to :"#{$view}"
  end
  
end
