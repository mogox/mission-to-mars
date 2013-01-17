require 'spec_helper'

describe Plateau do
  describe "initialize" do
    it "should take an argument and create a valid plateau" do
      plateau = Plateau.new '5 6'
      plateau.width.should eq 5
      plateau.height.should eq 6
    end

    it "should throw an error if no parameters are sent" do
      expect {Plateau.new}.to raise_error(ArgumentError)
    end

    it "should throw an error if invalid parameters are sent" do
      expect {Plateau.new 'a b'}.to raise_error
    end
  end

  describe '#squad' do
    subject { Plateau.new "5 5" }

    it "should return an Array" do
      subject.squad.is_a?(Array).should be_true
    end
  end

  describe "#move_rovers" do

    let(:rover_attr_1) do
      [].tap do |arr|
        arr << '1 2 N'
        arr << 'LMLMLMLMM'
      end
    end

    let(:rover_attr_2) do
      [].tap do |arr|
        arr << '3 3 E'
        arr << 'MMRMMRMRRM'
      end
    end

    it "should execute the instructions for all the rovers" do
      plateau = Plateau.new "5 5"

      rover = double(Rover)
      rover.should_receive(:follow_instructions).twice
      plateau.squad << rover << rover
      plateau.move_rovers

    end
  end


end