# frozen_string_literal: true

class Turn
  attr_writer :counter

  def initialize
    @counter = 0
  end


  def to_i
    counter
  end
end
