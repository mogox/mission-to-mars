require File.expand_path('../../app/plateau', __FILE__)
require File.expand_path('../../app/rover', __FILE__)
require File.expand_path('../../app/squad_console', __FILE__)
require File.expand_path('../../app/rover_direction', __FILE__)

class Mission
  def self.start
    squad_console = SquadConsole.new STDIN
    squad_console.explore_mars
    squad_console.print_final_positions
  end
end