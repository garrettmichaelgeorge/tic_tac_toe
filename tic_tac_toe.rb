# Run this script to play the game
require_relative 'print_helper'
require_relative 'game'
require_relative 'grid'
require_relative 'player'
require_relative 'mark'
require_relative 'turn'

include PrintHelper

# Initial setup
print "Player X name: "
player_x = gets.chomp
player_x = Player.new(player_x)

print "Player O name: "
player_o = gets.chomp
player_o = Player.new(player_o)

animate_bars_vertical_across

# Create new game
@game = Game.new(player_x, player_o)
# puts @game.inspect
# puts

puts

# Begin gameplay
@game.play
