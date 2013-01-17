require 'spec_helper'

describe Rover do
  let(:rover){ Rover.new '1 2 N' }

  describe "#initialize" do
    it "should take an argument with the initial position and direction" do
      rover.x.should eq 1
      rover.y.should eq 2
      rover.direction.should eq 'N'
    end

    it "should throw an error if no parameters are attached" do
      expect { Rover.new }.to raise_error(ArgumentError)
    end
  end

  describe "#follow_instructions" do

    it "should go through the entire list of instructions" do
      instructions = "123456"
      rover.instructions = instructions
      rover.should_receive(:execute).exactly(instructions.length).times
      rover.follow_instructions
    end

    describe "#move, given the instruction is <M> then" do
      before do
        rover.instructions = "M"
      end

      it "should move North when the direction is <N>" do
        rover.direction = 'N'
        rover.follow_instructions
        rover.y.should eq 3
        rover.x.should eq 1
      end

      it "should move East when the direction is <E>" do
        rover.direction = 'E'
        rover.follow_instructions
        rover.y.should eq 2
        rover.x.should eq 2
      end

      it "should move North when the direction is <S>" do
        rover.direction = 'S'
        rover.follow_instructions
        rover.y.should eq 1
        rover.x.should eq 1
      end

      it "should move Weast when the direction is <W>" do
        rover.direction = 'W'
        rover.follow_instructions
        rover.y.should eq 2
        rover.x.should eq 0
      end
    end


    it "should change the direction when the instruction is L or R"
  end
end
