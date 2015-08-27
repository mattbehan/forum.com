class Vote < ActiveRecord::Base

  belongs_to :votable, :polymorphic => true

  validates :votable_type, presence: true
  validates :value, presence: true

  # INPUT: called from an array of votes: e.g. question.votes.score_from_votes
  #OUTPUT: total score as an integer


end


# answer.vote_score
#question.vote_score
#question.highest_voted_answer
#answers.highest_voted
#answer.cast_vote
#question.cast_vote
#only be able to vote on question/answer once per user
