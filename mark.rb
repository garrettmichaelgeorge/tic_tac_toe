class Mark
  # marks should be symbols (:x and :o)
  attr_reader :type

  TYPES = [nil, :x, :o].freeze

  def initialize(type)
    raise StandardError, 'Invalid mark type' unless TYPES.include?(type)

    @type = type
  end

  def nil?
    self.type.nil?
  end

  def player
    Player.find()
  end

  def to_s
    if self.type.nil?
      ' '
    else
      self.type.to_s
    end
  end
end
