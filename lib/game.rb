class Game
  include PrintHelper

  attr_accessor :turn, :grid
  attr_reader :player_x, :player_o, :id

  @@id_counter = 1

  WINNING_ROWS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def initialize(player_x, player_o)
    @id = @@id_counter += 1
    @player_x = player_x
    @player_o = player_o
    @grid = Grid.new
    @turn = 0
  end

  def self.setup
    # Get player names from user input
    print "Player 1 (X's): "
    player_x = gets.chomp
    player_x = Player.new(player_x)

    print "Player O (O's): "
    player_o = gets.chomp
    player_o = Player.new(player_o)

    animate_string('Great! The game is about to begin.')
    animate_string('To exit at any time, type "exit" at the prompt and press <ENTER>.')

    pause

    # Create new game
    @game = Game.new(player_x, player_o)
    @game
  end

  def play
    at_exit do 
      puts LEADER + "Thank you for playing!\n"
      puts
    end

    display_intro_animation

    # Gameplay
    until over?
      next_turn
      puts
      grid.count_marks
      short_pause
    end

    over
  end

  private

  def positions
    grid.positions
  end

  def over?
    !!winner
  end

  def winner
    winning_mark = nil

    WINNING_ROWS.select do |row|
      if row.all? { |i| grid.xs.include?(i) }
        winning_mark = :x
      elsif row.all? { |i| grid.os.include?(i) }
        winning_mark = :o
      end
    end

    return if winning_mark.nil?

    # Select the player whose mark type is that of the winning row
    winner = ObjectSpace.each_object(Player).to_a.select { |player| player.mark_type == winning_mark }.first

    grid.display_with_animation_winner(winner)

    # winner.winner = true
    return winner
  end

  def quit
    pause
    puts
    puts LEADER + 'GAME ABORTED'
    exit
  end

  def over
    pause
    puts
    puts LEADER + 'GAME OVER'
    pause
    exit
  end

  def whose_turn?
    turn.even? || turn.zero? ? player_x : player_o
  end

  def next_turn
    player = whose_turn?

    # Print the grid to screen
    turn.zero? ? grid.display_with_animation : grid.display

    # Get grid position as input
    input = get_input_from(player)

    # Add the mark to the grid
    grid.add_mark!(player: player, position: input)
    self.turn += 1
  end

  def get_input_from(player)
    input = ''
    until correct_input?(input)
      print "#{player.name}'s turn!\nYour move (1-9): "
      input = gets.chomp
      quit if input == 'exit'
      input = input.to_i
      puts "Try again!" unless correct_input?(input)
    end
    input
  end

  def correct_input?(input)
    (1..9).include?(input) || input == 'exit'
  end
end
