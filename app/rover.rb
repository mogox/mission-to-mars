class Rover

  attr_accessor :instructions, :direction, :x, :y

  def initialize(position, instructions = nil)
    attributes = position.split
    @x = attributes[0].to_i
    @y = attributes[1].to_i
    @direction = RoverDirection.new attributes[2]
    self.instructions = instructions
  end

  def follow_instructions
    instructions.split('').each do |command|
      execute command
    end
  end

  def change_direction(rotation)
    if rotation == 'L'
      @direction.value -= 1
    else
      @direction.value += 1
    end
    @direction.value = @direction.value % 4
  end

private
  def execute(command)
    if command == "M"
      move_forward
    else
      change_direction command
    end
  end

  def move_forward
    moving_direction = direction.value
    if moving_direction == 0
      @y += 1
    elsif moving_direction == 1
      @x += 1
    elsif moving_direction == 2
      @y -= 1
    elsif moving_direction == 3
      @x -= 1
    end
  end
end

