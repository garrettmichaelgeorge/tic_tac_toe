# frozen_string_literal: true

class Grid
  include PrintHelper

  attr_accessor :positions, :xs, :os

  def initialize
    @positions = []
    9.times do
      @positions << Mark.new(nil)
    end
    @xs = []
    @os = []
  end

  def add_mark!(position:, player:)
    # Adjust position to accommodate a 0-indexed array (thus allowing for human-friendly input)
    position -= 1
    # Check to see that the position has not already been marked, i.e. is not nil
    unless positions[position].nil?
      puts 'That spot is already taken!'
      return
    end

    positions[position] = Mark.new(player.mark_type)
  end

  def display
    puts
    p_single_line
    puts
    positions.each_slice(3).map { |a| puts a.join('|').center(LINE_LENGTH) }
    puts
    p_single_line
    puts
  end

  def display_with_animation
    puts
    animate_bars_horizontal_across
    puts
    positions.each_slice(3).map { |a| puts a.join('|').center(LINE_LENGTH) }
    puts
    animate_bars_horizontal_across
    puts
  end

  def display_with_animation_winner(winner)
    display_with_animation
    puts
    pause
    animate_bars_horizontal_across
    puts "Winner is #{winner.name}!"
    animate_bars_horizontal_across
    puts
  end

  def count_marks
    # Separate @grid (ary) into 2 arrays, grouped by mark type (i.e. x's and o's).
    @xs = positions.size.times.select { |i| positions[i].type == :x }
    @os = positions.size.times.select { |i| positions[i].type == :o }

    # Optional: uncomment for debugging purposes
    # puts "xs = #{xs} (#{xs.size} total)"
    # puts "os = #{os} (#{xs.size} total)"
  end
end
