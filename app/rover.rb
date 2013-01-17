class Rover
  attr_reader :x, :y
  attr_accessor :instructions, :direction

  def initialize(position)
    attributes = position.split
    @x = attributes[0].to_i
    @y = attributes[1].to_i
    @direction = attributes[2]
  end

  def follow_instructions
    instructions.split('').each do |command|
      execute command
    end
  end

private
  def execute(command)

  end
end