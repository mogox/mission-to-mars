class SquadConsole
  attr_reader :input, :plateau

  def initialize(input_source )
    @input = input_source
  end

  def explore_mars
    setup_plateau
    set_rover_positions
    move_rovers
  end

  def print_final_positions
    @plateau.squad.each  do |rover|
      puts "#{rover.x} #{rover.y} #{rover.direction.cardinal}"
    end
  end

private
  def setup_plateau
    @plateau = Plateau.new @input.gets.strip
  end

  def build_rover(position)
    Rover.new(position, @input.gets.strip)
  end

  def set_rover_positions
    rover_position = @input.gets.strip
    while rover_position.length > 0 do
      rover = build_rover(rover_position)
      @plateau.squad << rover
      rover_position = @input.gets.strip
    end
  end

  def move_rovers
    @plateau.move_rovers if @plateau
  end
end