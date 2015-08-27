class Answer < ActiveRecord::Base

  belongs_to :user
  belongs_to :question

  has_many :votes, :as => :votable

  validates :body, presence: true

  def has_user_voted_on_this_before? user_id
    Vote.find_by(value: value, votable_type: self.class, user_id: user_id)
  end



  #to be called as question.vote_score/ answer.vote_score
  #OUTPUT: total score as an integer
  def vote_score
    votes.sum(:value)
  end

  # def score_from_votes
  #   self.reduce(0, :+){|sum, vote| sum + vote.value}
  # end



  # x=0 10.times do Vote.(value: rand(2), votable_type: "answer", user_id=x  ) x +=1 end

  # user1=User.first, user2=User.second, question1=Question.first, question2


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


