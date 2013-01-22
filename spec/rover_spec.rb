require 'spec_helper'

describe Rover do
  let(:rover){ Rover.new '1 2 N' }

  describe "#initialize" do
    it "should take an argument with the position and direction" do
      rover.x.should eq 1
      rover.y.should eq 2
      rover.direction.cardinal.should eq 'N'
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

    describe "#move_forward, given the instruction is <M> then" do
      before do
        rover.instructions = "M"
      end

      subject{ rover.follow_instructions }

      it "should move North when the direction is <N>" do
        rover.direction.cardinal = 'N'
        subject
        rover.x.should eq 1
        rover.y.should eq 3
      end

      it "should move East when the direction is <E>" do
        rover.direction.cardinal = 'E'
        subject
        rover.y.should eq 2
        rover.x.should eq 2
      end

      it "should move North when the direction is <S>" do
        rover.direction.cardinal = 'S'
        subject
        rover.y.should eq 1
        rover.x.should eq 1
      end

      it "should move Weast when the direction is <W>" do
        rover.direction.cardinal = 'W'
        subject
        rover.y.should eq 2
        rover.x.should eq 0
      end
    end

    describe "#change_direction" do
      subject{ rover.follow_instructions }

      context "given the instruction is <L>" do
        before do
          rover.instructions = "L"
        end

        it "should face 'W' when the direction is 'N'" do
          rover.direction.cardinal = 'N'
          subject
          rover.direction.cardinal.should eq 'W'
        end

        it "should face 'E' when the direction is 'S'" do
          rover.direction.cardinal = 'S'
          subject
          rover.direction.cardinal.should eq 'E'
        end

        it "should face 'S' when the direction is 'W'" do
          rover.direction.cardinal = 'W'
          subject
          rover.direction.cardinal.should eq 'S'
        end

        it "should face 'N' when the direction is 'E'" do
          rover.direction.cardinal = 'E'
          subject
          rover.direction.cardinal.should eq 'N'
        end
      end

      context "given the instruction is <L>" do
        before do
          rover.instructions = "R"
        end

        it "should face 'E' when the direction is 'N'" do
          rover.direction.cardinal = 'N'
          subject
          rover.direction.cardinal.should eq 'E'
        end

        it "should face 'W' when the direction is 'S'" do
          rover.direction.cardinal = 'S'
          subject
          rover.direction.cardinal.should eq 'W'
        end

        it "should face 'S' when the direction is 'E' " do
          rover.direction.cardinal = 'E'
          subject
          rover.direction.cardinal.should eq 'S'
        end

        it "should face 'N' when the direction is 'W' " do
          rover.direction.cardinal = 'W'
          subject
          rover.direction.cardinal.should eq 'N'
        end
      end
    end


  end
end
