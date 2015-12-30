require_relative '../lib/voting'

describe Voting::Candidate do
  describe ".new" do
    it "accepts the correct parameters" do
      expect{Voting::Candidate.new(1)}.to_not raise_error
    end

    it "raises an exception when there aren't enough arguments given" do
      expect{Voting::Candidate.new()}.to raise_error(ArgumentError)
    end

    it "starts with a tally of zero" do
      expect(Voting::Candidate.new(1).votes).to eql 0
    end
  end

  describe ".tally" do

    it "increments the score based on weight" do
      candidate = Voting::Candidate.new(1)
      expect(candidate.tally(0)).to eql 10
      expect(candidate.tally(1)).to eql 15
      expect(candidate.tally(2)).to eql 16
    end

    it "can handle when a candidate is not in the top three" do
      candidate = Voting::Candidate.new(1)
      expect(candidate.tally(3)).to eql 0
    end

    it "raises when a non-integer argument is given" do
      candidate = Voting::Candidate.new(1)
      expect{candidate.tally('1')}.to raise_error(ArgumentError)
    end
  end
end
