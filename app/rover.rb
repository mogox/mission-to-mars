class Rover
  DIRECTIONS = {  0 => 'N',
                  1 => 'E',
                  2 => 'S',
                  3 => 'W'
                }

  attr_accessor :instructions, :direction, :x, :y

  def initialize(position, instructions = nil)
    attributes = position.split
    @x = attributes[0].to_i
    @y = attributes[1].to_i
    set_direction_by_letter attributes[2]
    self.instructions = instructions
  end

  def follow_instructions
    instructions.split('').each do |command|
      execute command
    end
  end

  def set_direction_by_letter(letter)
    @direction = DIRECTIONS.key(letter)
  end

  def direction_letter
    DIRECTIONS[@direction % 4]
  end

  def change_direction(rotation)
    if rotation == 'L'
      @direction -= 1
    else
      @direction += 1
    end
    @direction = @direction % 4
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
    if self.direction == 0
      @y += 1
    elsif self.direction == 1
      @x += 1
    elsif self.direction == 2
      @y -= 1
    elsif self.direction == 3
      @x -= 1
    end
  end

end