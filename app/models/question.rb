class Question < ActiveRecord::Base

  belongs_to :user
  has_many :answers
  has_many :votes, :as => :votable
  has_many :comments, as: :commentable
  has_many :edits, as: :editable
  has_many :sides
  has_many :taggings
  has_many :tags, through: :taggings



  validates :title, presence: true
  validates :body, presence: true

  # INPUT: user_id
  # OUTPUT: true/false
  def has_user_voted_on_this_before? user_id
    votes.find_by(user_id: user_id) != nil
  end

  #returns an array of the answers sorted by their vote score in descending order
  def highest_voted_answers
    answers.sort_by {|answer| answer.vote_score}.reverse
  end

  #to be called as question.vote_score/ answer.vote_score. returns the score for a particular question/answer
  #OUTPUT: total score as an integer
  def vote_score
    votes.sum(:value)
  end


end
