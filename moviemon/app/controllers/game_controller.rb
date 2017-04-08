#require '../models/game_sessions.rb'

class GameController < ApplicationController
  $view ||= 'title_screen'
# $selected =
# $game = 
  $player = {slot: 1, position: [0, 0], life: 20, strength: 5}

  def title_screen
  end

  def shutdown
  end

  def loading_game
  end

  def saving_game
  end

  def world_map
  end

  def power
    if $view == 'shutdown'
      $view = 'title_screen'
      redirect_to :"#{$view}"
    else
      $view = 'shutdown'
      redirect_to :"#{$view}"
    end
  end

  def buttonA
    case $view
    when "loading_game", "saving_game"
      GameSession.new.save
      redirect_to world_map_path
    else
      redirect_to :"#{$view}"
    end
  end

  def buttonB
    redirect_to :"#{$view}"
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
    when "title_screen" #launch new game
      $player = {slot: 1, position: [0, 0], life: 20, strength: 5}
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
    case $view
    when "world_map"
      $player[:position][1] -= 10
      $view = "world_map"
      redirect_to :"#{$view}"
    when "loading_game", "saving_game"
      $player[:slot] = $player[:slot] > 1 ? $player[:slot] - 1 : 3
      redirect_to :"#{$view}"
    else
      redirect_to :"#{$view}"
    end
  end

  def down
    case $view
    when "world_map" 
      $player[:position][1] += 10
      $view = "world_map"
      redirect_to :"#{$view}"
    when "loading_game", "saving_game"
      $player[:slot] = $player[:slot] < 3 ? $player[:slot] + 1 : 1
      redirect_to :"#{$view}"
    else
      redirect_to :"#{$view}"
    end
  end

  def right
    case $view
    when "world_map" 
      $player[:position][0] += 10
      $view = "world_map"
      redirect_to :"#{$view}"
    when "loading_game", "saving_game"

    end
  end

  def left
    case $view
    when "world_map" 
      $player[:position][0] -= 10
      $view = "world_map"
      redirect_to :"#{$view}"
    when "loading_game", "saving_game"

    end
  end
  
end
