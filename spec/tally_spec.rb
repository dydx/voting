require_relative '../lib/voting'

describe Voting::Tally do
  before(:each) do
    @candidate = Voting::Candidate.new(1)
    @candidate2 = Voting::Candidate.new(2)
    @candidate3 = Voting::Candidate.new(3)

    @ballot = Voting::Ballot.new(
      id: 1,
      voter_id: 1,
      choices: [1, 2, 3]
    )

    @ballot2 = Voting::Ballot.new(
      id: 2,
      voter_id: 2,
      choices: [3, 2, 1]
    )

    @ballot3 = Voting::Ballot.new(
      id: 3,
      voter_id: 3,
      choices: [3, 2, 1]
    )
  end

  describe ".new" do
    it "accepts the correct parameters" do
      candidates = [@candidate]
      ballots = [@ballot]
      expect{Voting::Tally.new(candidates, ballots)}.to_not raise_error
    end

    it "tallies the votes for a single candidate with a single voter" do
      candidates = [@candidate]
      ballots = [@ballot]
      expect(Voting::Tally.new(candidates, ballots).winner).to eql @candidate
    end

    it "tallies the votes for a single candidate with a single voter" do
      candidates = [@candidate]
      ballots = [@ballot, @ballot.clone, @ballot.clone]
      expect(Voting::Tally.new(candidates, ballots).winner).to eql @candidate
    end

    it "tallies the votes for multiple ballots and candidates" do
      candidates = [@candidate,@candidate2,@candidate3]
      ballots = [@ballot, @ballot2, @ballot3]
      expect(Voting::Tally.new(candidates, ballots).winner).to eql @candidate3
    end
  end
end
