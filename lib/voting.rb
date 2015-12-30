module Voting
  class Ballot; end

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
end
