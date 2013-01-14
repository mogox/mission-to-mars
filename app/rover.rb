class Rover
  attr_reader :x, :y, :direction

  def initialize(position)
    attributes = position.split
    @x = attributes[0].to_i
    @y = attributes[1].to_i
    @direction = attributes[2]
  end
end