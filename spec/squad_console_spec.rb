require 'spec_helper'

class SquadConsoleInput
  attr_accessor :input_text

  def initialize(text)
    @input_text = text || []
  end

  def read
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

    context "Creates a plateau" do
      it "should create a plateau with the first input" do
        squadConsole = SquadConsole.new @input
        Plateau.should_receive(:new).with(plateau_size)
        squadConsole.explore_mars
      end
    end

    context "Setups the rovers" do
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
        data.flatten.reverse
      end

      it "should create two rovers and locate them in the plateau" do
        squadConsole = SquadConsole.new @input
        squadConsole.should_receive(:move_rovers)

        squadConsole.explore_mars
        squad = squadConsole.plateau.squad
        squad.size.should eq 2
        rover_1 = squad.first
        rover_1.x.should eq 1
        rover_1.y.should eq 2
        rover_1.direction.should eq 'N'

        rover_2 = squad.last
        rover_2.x.should eq 3
        rover_2.y.should eq 3
        rover_2.direction.should eq 'E'
      end

      it "should move the rovers and update their position" do
        squadConsole = SquadConsole.new @input
        squadConsole.explore_mars
        squad = squadConsole.plateau.squad

        squad.size.should eq 2
        rover_1 = squad.first
        rover_1.x.should eq 1
        rover_1.y.should eq 3
        rover_1.direction.should eq 'N'

        rover_2 = squad.last
        rover_2.x.should eq 3
        rover_2.y.should eq 3
        rover_2.direction.should eq 'E'
      end

      context "where the squad in the plateau" do
        let(:north_rover) { Rover.new "0 0 N"}

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