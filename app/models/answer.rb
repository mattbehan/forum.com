class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
  has_many :edits, as: :editable
  has_one :siding
  has_one :side, through: :siding


  validates :body, presence: true

  def has_user_voted_on_this_before? user_id
    votes.find_by(user_id: user_id) != nil
  end

  #to be called as question.vote_score/ answer.vote_score
  #OUTPUT: total score as an integer
  def vote_score
    votes.sum(:value)
  end

end

# answer.vote_score
#question.vote_score
#question.highest_voted_answer
#answers.highest_voted
#user.cast_vote (on question/answer)
#question.highest_voted_answers
#question/answer.has_user_voted_on_this_before?
#only be able to vote on question/answer once per user
#user.reputation_from_posted_questions_and_answers
