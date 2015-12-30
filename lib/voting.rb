module Voting
  class Ballot
    attr_reader :id, :voter_id, :choices
    def initialize(id:, voter_id:, choices:)
      if !id.instance_of?(Fixnum)
        raise ArgumentError, "Invalid Ballot ID Given"
      elsif !voter_id.instance_of?(Fixnum)
        raise ArgumentError, "Invalid Voter ID Given"
      elsif !choices.instance_of?(Array)
        raise ArgumentError, "Invalid Choices Given"
      end

      @id = id
      @voter_id = voter_id
      @choices = choices
    end

  end

  class Candidate
    attr_reader :id, :votes
    def initialize(id)
      @id = id
      @votes = 0
    end

    def tally(position)
      if !position.instance_of? Fixnum
        raise ArgumentError, "Invalid Ballot Index Given"
      end

      @votes += ([10, 5, 1][position] || 0)
    end
  end

  class Tally
    def initialize(candidates, ballots)
      if !candidates.all? { |c| c.instance_of? Candidate }
        raise ArgumentError, "Invalid Candidate List Given"
      elsif !ballots.all? { |c| c.instance_of? Ballot }
        raise ArgumentError, "Invalid Ballot List Given"
      end

      @candidates = candidates
      @ballots = ballots
    end

    def winner
      @candidates.each do |candidate|
        @ballots.each do |ballot|
          candidate.tally(ballot.choices.index(candidate.id))
        end
      end.sort_by { |candidate| -candidate.votes }.first
    end
  end
end
