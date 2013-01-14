require File.expand_path('../../app/plateau', __FILE__)
require File.expand_path('../../app/rover', __FILE__)

describe Rover do
  context "initialize" do
    it "should take an argument with the initial position and direction" do
      rover = Rover.new '1 2 N'
      rover.x.should eq 1
      rover.y.should eq 2
      rover.direction.should eq 'N'
    end

    it "should throw an error if no parameters are attached" do
      expect { Rover.new }.to raise_error(ArgumentError)
    end
  end
end
