# Voting
[![Build Status](https://travis-ci.org/dydx/voting.svg?branch=master)](https://travis-ci.org/dydx/voting)

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

The only parameter passed into the initializer is the `id` that you'd like to
associate with that `candidate`. This could be pulled from your database, or
assigned some other way (even manually!)

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

The first parameter of the Ballot initializer is the id that you'd like to
associate with that particular ballot.

The next is the `voter_id` of the individual doing the voting.

The final parameter is an array of `id`'s that correlate to candidate `id`'s.

For example, given these candidates:

> ```
> bob = Voting::Candidate.new(1)
> sue = Voting::Candidate.new(2)
> sally = Voting::Candidate.new(3)
> ```

Your ballots would resemble the one from the Ballot code example with a
`choices` array containing `id`'s from 1 to 3. The order of this array is
important, and is both defined by the voter and then used to calculate the
runoff.

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

# Installation

*Bundler*
> 1. Add `gem 'voting', :github => 'dydx/voting'` to your Gemile
> 2. `bundle install`
> 3. require 'voting'
> 4. ???
> 5. Take over the world
