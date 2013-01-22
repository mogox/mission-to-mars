class RoverDirection
  DIRECTIONS = {  0 => 'N',
                  1 => 'E',
                  2 => 'S',
                  3 => 'W'
                }

  attr_accessor :value

  def initialize(val)
    self.cardinal = val
  end

  def cardinal=(val)
    @value = DIRECTIONS.key(val)
  end

  def cardinal
    return '' unless @value
    DIRECTIONS[@value % DIRECTIONS.length]
  end
end