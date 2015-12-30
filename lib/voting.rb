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
    attr_reader :id, :first_name, :last_name, :votes
    def initialize(id:, first_name:, last_name:)
      if !id.instance_of? Fixnum
        raise ArgumentError, "Invalid Candidate ID Given"
      elsif !first_name.instance_of? String
        raise ArgumentError, "Invalid First Name Given"
      elsif !last_name.instance_of? String
        raise ArgumentError, "Invalid Last Name Given"
      end

      @id = id
      @first_name = first_name
      @last_name = last_name
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

  end
end
