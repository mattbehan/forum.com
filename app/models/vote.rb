class Vote < ActiveRecord::Base

  belongs_to :votable, :polymorphic => true

  validates :votable_type, presence: true
  validates :value, presence: true




end


# answer.vote_score
#question.vote_score
#question.highest_voted_answer
#answers.highest_voted
#answer.cast_vote
#question.cast_vote
#only be able to vote on question/answer once per user
Vote.create
