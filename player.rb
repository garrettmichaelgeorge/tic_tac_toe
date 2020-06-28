# frozen_string_literal: true

class Player
  attr_reader :mark_type
  attr_accessor :name

  @@number_of_players = 0

  def initialize(name="New Player")
    case @@number_of_players
    when 0
      @mark_type = :x
    when 1
      @mark_type = :o
    else
      raise StandardError, 'Cannot have more than 2 players'
    end

    @name = name
    @winner = false

    @@number_of_players += 1
  end
end
