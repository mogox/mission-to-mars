class Plateau
  attr_reader :height, :width
  attr_accessor :squad

  def initialize(input_size)
    attributes = input_size.split
    @width = attributes[0].to_i
    @height = attributes[1].to_i
    raise InvalidArgument if @width.zero? || @height.zero?
    @squad = []
  end

  class InvalidArgument; end
end



