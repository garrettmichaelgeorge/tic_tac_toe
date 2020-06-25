class Game
  def initialize
    @players = []
    @grid = []
    @turn = 0
  end

  def self.create
    id = rand(1000..9999)
    player_x = Player.new(mark: :x)
    player_o = Player.new(mark: :o)
    turn = Turn.new(0)
    Game.new()
  end


  private

  def begin
    puts 'BEGIN GAME'
  end

  def end
    puts 'GAME OVER'
  end
end
