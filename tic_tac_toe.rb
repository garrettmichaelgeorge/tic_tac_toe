# Run this script to play the game
require_relative 'print_helper'
require_relative 'game'
require_relative 'grid'
require_relative 'player'
require_relative 'mark'
require_relative 'turn'

@game = Game.setup

# Begin gameplay
@game.play
