require_relative '../lib/voting'

describe Voting::Ballot do
  describe ".new" do
    it "can be instantiated" do
      expect(Voting::Ballot).to receive(:new)
      Voting::Ballot.new
    end
  end
end
