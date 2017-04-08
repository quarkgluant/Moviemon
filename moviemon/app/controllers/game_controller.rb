#require '../models/game_sessions.rb'

class GameController < ApplicationController
  $view ||= 'title_screen'
# $selected =
# $game = 
  $player = {slot: 1, position: [0, 0], life: 20, strength: 5, moviedex: []}

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

  def battle
  end

  def moviedex
  end

  def victory
  end

  def lose
  end

  def coward
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
      $view = "world_map"
      GameSession.new.save
      redirect_to world_map_path
    when "coward", "victory", "lose"
      $view = "world_map"
      redirect_to world_map_path
    when "battle"
      $selected[:life] = $selected[:life] - $player[:strength]
      if $selected[:life] <= 0
        $view = "victory"
        $player[:life] = 20
        $player[:moviedex].push($selected)
        $player[:strength] = $player[:strength] + 1
        $selected = ""
      else
        $player[:life] = $player[:life] - $selected[:strength]
        if $player[:life] <= 0
          $view = "lose"
          $selected = ""
          $player[:life] = 20
        end
      end
      redirect_to :"#{$view}"
    else
      redirect_to :"#{$view}"
    end
  end

  def buttonB
    if $view == "battle"
      $selected = ""
      $player[:life] = 20
      $view = "coward"
    end
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
      imdb = GameSession.new.get_movie
      $player = {slot: 1, position: [0, 0], life: 20, strength: 5, movies: imdb, moviedex: []}
      $view = "world_map"
      redirect_to :"#{$view}"
    when "world_map"
      $view = "moviedex"
      redirect_to :"#{$view}"   
    else
      redirect_to :"#{$view}"
    end
  end

  def up
    case $view
    when "world_map"
      $player[:position][1] = $player[:position][1] < 10 ? $player[:position][1] : $player[:position][1] -= 10
      if rand(100) > 50
        $view = "battle"
        $selected = $player[:movies].pop
      end
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
      $player[:position][1] = $player[:position][1] > 80 ? $player[:position][1] : $player[:position][1] += 10
      if rand(100) > 50
        $view = "battle"
        $selected = $player[:movies].pop
      end
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
      $player[:position][0] = $player[:position][0] > 80 ? $player[:position][0] : $player[:position][0] += 10
      if rand(100) > 50
        $view = "battle"
        $selected = $player[:movies].pop
      end
      redirect_to :"#{$view}"
    when "loading_game", "saving_game"

    end
  end

  def left
    case $view
    when "world_map" 
      $player[:position][0] = $player[:position][0] < 10 ? $player[:position][0] : $player[:position][0] -= 10
      if rand(100) > 50
        $view = "battle"
        $selected = $player[:movies].pop
      end
      redirect_to :"#{$view}"
    when "loading_game", "saving_game"

    end
  end
  
end
