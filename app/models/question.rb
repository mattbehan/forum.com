class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers

  has_many :votes, :as => :votable

  validates :title, presence: true
  validates :body, presence: true

  def has_user_voted_on_this_before? user_id
    Vote.find_by(value: value, votable_type: self.class, user_id: user_id)
  end

  def highest_voted_answers
    answers.sort {|answer| answer.vote_score}
  end

  #to be called as question.vote_score/ answer.vote_score. returns the score for a particular question/answer
  #OUTPUT: total score as an integer
  def vote_score
    votes.sum(:value)
  end

end
