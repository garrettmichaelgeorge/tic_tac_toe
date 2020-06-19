class Game
  def initialize
    @id = rand(1000..9999)
    @player_x = Player.new(mark: :x)
    @player_o = Player.new(mark: :o)
    @turn = Turn.new(0)
  end

  def begin

  end

  def end

  end
end
