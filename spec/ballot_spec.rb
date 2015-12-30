require_relative '../lib/voting'

describe Voting::Ballot do
  describe ".new" do
    it "accepts the correct parameters" do
      expect{Voting::Ballot.new(
        id: 1,
        voter_id: 1,
        choices: []
      )}.to_not raise_error
    end

    it "raises an error with the wrong number of parameters" do
      expect{Voting::Ballot.new()}.to raise_error(ArgumentError)
    end

    it "raises an error with non-integer id" do
      expect{Voting::Ballot.new(
        id: '',
        voter_id: 1,
        choices: []
      )}.to raise_error(ArgumentError)
    end

    it "raises an error with non-integer voter_id" do
      expect{Voting::Ballot.new(
        id: 1,
        voter_id: '',
        choices: []
      )}.to raise_error(ArgumentError)
    end

    it "raises an error with non-array choices" do
      expect{Voting::Ballot.new(
        id: 1,
        voter_id: 1,
        choices: ''
      )}.to raise_error(ArgumentError)
    end
  end
end
