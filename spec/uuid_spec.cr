require "./spec_helper"

describe UUIX do
  describe "#random" do
    it "returns a string" do
      typeof(UUIX.random).should eq String
    end

    it "returns 36 characters" do
      UUIX.random.size.should eq 36
    end
  end
end
