# frozen_string_literal: true

class Player
  @@number_of_players = 0

  def initialize('New Player')
    case @@number_of_players
    when 0
      @mark = :x
    when 1
      @mark = :o
    else
      raise StandardError, 'Cannot have more than 2 players'
    end
    @name = name

    @@number_of_players += 1
  end
end
