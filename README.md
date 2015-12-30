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

Ballots are cast with three choices, and each slot of the ballot is assigned
incrementally decreasing weights: the first choice gets a weight of 10, the next
gets a weight of 5, and the last gets a weight of 1.

Ballots are stored and represented similarly to this:

> ```
> {
>   ballot: {
>     id: 1,
>     voter_id: 1,
>     choices: [
>       'bob',
>       'sue',
>       'sally'
>     ]
>   }
> }
> ``` 

After all of the ballots are cast, each candidate should have a total score,
which can then be used to see who wins
