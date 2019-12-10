require 'rails_helper'

describe VenuesHelper do
  describe "#oddness" do
    it "should verify that an odd number is odd" do
      oddness(7).should eq("odd")
      oddness(19).should eq("odd")
    end

    it "should verify that an even number is even" do
      oddness(8).should eq("even")
      oddness(10).should eq("even")
    end
  end
end
