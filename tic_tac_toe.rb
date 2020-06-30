# Run this script to play the game
require_relative 'lib/helpers/print_helper'
require_relative 'lib/game'
require_relative 'lib/grid'
require_relative 'lib/player'
require_relative 'lib/mark'

include PrintHelper

display_welcome_animation

@game = Game.setup

@game.play
