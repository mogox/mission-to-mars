class SquadConsole
  attr_reader :input, :plateau

  def initialize(input_source)
    @input = input_source
  end

  def setup_plateau
    @plateau = Plateau.new @input.read
  end

  def explore_mars
    setup_plateau
    rover_position = @input.read
    while rover_position.length > 0 do
      rover = Rover.new(rover_position)
      rover.instructions = @input.read
      @plateau.squad << rover
      rover_position = @input.read
    end
    move_rovers
  end

private
  def move_rovers
    @plateau.move_rovers if @plateau
  end
end