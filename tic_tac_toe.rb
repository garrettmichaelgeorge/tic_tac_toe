# Run this script to play the game
require_relative 'game'
require_relative 'grid'
require_relative 'mark'
require_relative 'player'
require_relative 'turn'
require_relative 'row'

print "Player X name: "
player_x = gets.chomp
@player_x = Player.new(player_x)

print "Player O name: "
player_o = gets.chomp
@player_o = Player.new(player_o)

game = Game.new
puts game.inspect
puts @player_x.inspect
puts @player_o.inspect
