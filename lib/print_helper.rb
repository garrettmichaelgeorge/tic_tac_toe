module PrintHelper
  LINE_LENGTH = 30
  DEFAULT_SYMBOL = '<>'
  LEADER = '=== '.freeze
  DURATION_LONG = 0.7
  DURATION_MEDIUM = 0.5
  DURATION_SHORT = 0.04

  def pause
    sleep DURATION_LONG
  end

  def short_pause
    sleep DURATION_SHORT
  end

  def print_single_line
    puts "-" * LINE_LENGTH
  end

  def print_double_line
    puts "=" * LINE_LENGTH
  end

  def animate_bars_vertical_across
    LINE_LENGTH.times do |i|
      puts ' ' * i + DEFAULT_SYMBOL
      short_pause
    end

    LINE_LENGTH.times do |i|
      puts ' ' * (LINE_LENGTH - i) + DEFAULT_SYMBOL
      short_pause
    end
  end

  def animate_string(str)
    str.split("").each do |char|
      print char
      short_pause
    end
    puts
  end

  def animate_bars_horizontal_across(type: 'single')
    printer = case type
              when 'double'
                '='
              else
                '-'
              end

    LINE_LENGTH.times do
      print printer
      short_pause
    end
    puts
  end

  def display_intro_animation
    animate_bars_vertical_across
    pause
    animate_string('BEGIN GAME')
    pause
    animate_bars_vertical_across
  end

  def display_welcome_animation
    animate_string('Welcome to Tic-Tac-Toe!')
    pause
    animate_string('Let\'s get started. Who is playing today?')
    pause
  end

  alias p_single_line print_single_line
  alias p_double_line print_double_line
end
