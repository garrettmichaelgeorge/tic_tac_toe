# Run this script to play the game
require_relative 'print_helper'
require_relative 'game'
require_relative 'grid'
require_relative 'player'
require_relative 'mark'
require_relative 'turn'

include PrintHelper

display_welcome_animation

@game = Game.setup

@game.play
