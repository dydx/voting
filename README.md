# Voting

Instant runoff voting stuff

Given three candidates:

* Bob
* Sue
* Sally

The Democratic People's Republic of Mendez wishes to allow its citizens to vote
for its new supreme leader. There are many systems for voting, though the one
that they are going to employ is called Instant Run-off Voting.

This system asks voters to rank their choices from those they would most like to
win to those they would least like to win. A process is used to calculate the
total weight of each candidates votes, and a truly representative candidate is
chosen.

The DPRM could also use the ranked results to have a chain of command

Candidates are represented like this:

> Candidate Example
> ```
> candidate = Voting::Candidate.new(1)
> ```

Ballots are cast with three choices, and each slot of the ballot is assigned
incrementally decreasing weights: the first choice gets a weight of 10, the next
gets a weight of 5, and the last gets a weight of 1.

Ballots are stored and represented like this:

> Ballot / Voter example
> ```
> voter = Voting::Ballot.new(
>   id: 1,
>   voter_id: 1,
>   choices: [3, 1, 2]
> )
> ``` 

After all of the ballots are cast, or even as they are still being turned in,
the DPRM is able to get results back:

> Tallying
> ```
> winner = Voting:Tally.new(
>   [<list of candidates>],
>   [<list of votes>]
> ).winner
> ```

The `winner` variable there will contain the `Candidate` object of the winning
`Candidate`!
