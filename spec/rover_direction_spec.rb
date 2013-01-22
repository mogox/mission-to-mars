require 'spec_helper'

describe RoverDirection do
  describe "#initialize" do
    context "initializes correctly" do
      subject { RoverDirection.new 'E' }

      its(:value) { should eq 1 }
      its(:cardinal) { should eq 'E' }
    end
  end
end