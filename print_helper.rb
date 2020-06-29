module PrintHelper
  LINE_LENGTH = 30
  LEADER = '=== '.freeze
  DURATION_LONG = 1
  DURATION_MEDIUM = 0.5
  DURATION_SHORT = 0.05

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
      puts ' ' * i + '|'
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
    case type
    when 'double'
      printer = '='
    else
      printer = '-'
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
    animate_string("BEGIN GAME")
    pause
    animate_bars_vertical_across
  end

  alias p_single_line print_single_line
  alias p_double_line print_double_line
end
