class Plateau
  attr_reader :height, :width
  attr_accessor :squad

  def initialize(input_size)
    raise ArgumentError unless input_size
    attributes = input_size.split
    @width = attributes[0].to_i
    @height = attributes[1].to_i
    raise ArgumentError if @width.zero? || @height.zero?
    @squad = []
  end

  def move_rovers
    squad.each do |rover|
      rover.follow_instructions
    end
  end
end


