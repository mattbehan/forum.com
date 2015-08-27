class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  has_many :votes, :as => :votable

  validates :body, presence: true

  #called from user
  #INPUT: Value is an integer representing upvote/downvote, votable is the OBJECT that the user is voting on. called as user.cast_vote
  # Output: no usable output. creates a vote object.
  def cast_vote (value, votable)
    #need to change class to string
    new_vote = Vote.create(value: value, votable_id: votable.id,votable_type: votable.class.to_s, user_id: self.user_id)
    self.votes << new_vote
  end

  def reputation_from_posted_questions_and_answers
    Vote.where(user_id: self.id).score_from_votes
  end

  # input
  def has_user_voted_on_this_before? user_id
    Vote.find_by(value: value, votable_type: self.class, user_id: user_id)
  end


  # this needs to be called in questions
  def highest_voted_answers
    self.answers.sort {|answer| answer.vote_score}
  end

  #to be called as question.vote_score/ answer.vote_score
  def vote_score
    self.votes.score_from_votes
  end

  def score_from_votes
    self.reduce(0, :+){|sum, vote| sum + vote.value}
  end

  # x=0 10.times do Vote.(value: rand(2), votable_type: "answer", user_id=x  ) x +=1 end

end

# answer.vote_score
#question.vote_score
#question.highest_voted_answer
#answers.highest_voted
#answer.cast_vote
#question.cast_vote
#only be able to vote on question/answer once per user


