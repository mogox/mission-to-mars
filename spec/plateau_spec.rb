#require File.expand_path('spec_hepler.rb')
require File.expand_path('../../app/plateau', __FILE__)

describe Plateau do
  context "initialize" do
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

  context '#squad' do
    subject { Plateau.new "5 5" }

    it "should return an Array" do
      subject.squad.is_a?(Array).should be_true
    end
  end


end