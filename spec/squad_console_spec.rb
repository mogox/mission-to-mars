require 'spec_helper'

# Class for mocking the input from STDIN
class SquadConsoleInput
  attr_accessor :input_text

  def initialize(text)
    # since we're going to use pop to retreive
    # each line we need it in reverse order
    @input_text = text.reverse || []
  end

  def gets
    if @input_text && @input_text.length > 0
      @input_text.pop
    else
      ''
    end
  end

end

describe SquadConsole do
  describe "explore_mars" do
    let(:plateau_size){ '5 5' }
    let(:input_data) do
      [].tap do |arr|
        arr << plateau_size
      end
    end

    before do
      @input = SquadConsoleInput.new input_data
    end

    describe "#setup_plateau" do
      it "should create a plateau with the first input" do
        squadConsole = SquadConsole.new @input
        Plateau.should_receive(:new).with(plateau_size)
        squadConsole.explore_mars
      end
    end

    describe "#set_rover_positions" do
      let(:rover_1) do
        [].tap do |arr|
          arr << '1 2 N'
          arr << 'LMLMLMLMM'
        end
      end

      let(:rover_2) do
        [].tap do |arr|
          arr << '3 3 E'
          arr << 'MMRMMRMRRM'
        end
      end

      let(:input_data) do
        data = [].tap do |arr|
          arr << plateau_size
          arr << rover_1
          arr << rover_2
        end
        data.flatten
      end

      it "should create two rovers and locate them in the plateau" do
        squadConsole = SquadConsole.new @input

        # we mock the move so the rovers stay on the initial position
        squadConsole.should_receive(:move_rovers)

        squadConsole.explore_mars
        squad = squadConsole.plateau.squad

        squad.size.should eq 2
        rover_1 = squad.first
        rover_1.x.should eq 1
        rover_1.y.should eq 2
        rover_1.direction.cardinal.should eq 'N'

        rover_2 = squad.last
        rover_2.x.should eq 3
        rover_2.y.should eq 3
        rover_2.direction.cardinal.should eq 'E'
      end

      it "should update each rover position" do
        squadConsole = SquadConsole.new @input
        squadConsole.explore_mars
        squad = squadConsole.plateau.squad

        rover_1 = squad.first
        rover_1.x.should eq 1
        rover_1.y.should eq 3
        rover_1.direction.cardinal.should eq 'N'

        rover_2 = squad.last
        rover_2.x.should eq 5
        rover_2.y.should eq 1
        rover_2.direction.cardinal.should eq 'E'
      end

      context "where the squad in the plateau" do
        let(:north_rover) { Rover.new "0 0 N" }

        it "has a list of the rovers created" do
          squadConsole = SquadConsole.new @input
          squadConsole.explore_mars
          squad = squadConsole.plateau.squad
          squad.size.should eq 2
          squad.first.is_a?(Rover).should be_true
        end
      end
    end
  end
end