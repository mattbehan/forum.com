class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments, as: :commentable
  has_many :edits, as: :editable
  has_many :sidings, through: :sides
  has_many :sided_users
  has_many :sides, through: :sided_users
  has_many :chosen_sides, through: :sides, source: :siding
  has_many :chosen_side_from_answers, through: :chosen_sides, source: :answer
  has_many :chosen_sides_of_questions, through: :chosen_side_from_answers, source: :question


  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password_hash, presence: true
  # validate :valid_new_password


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @new_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
    # create instance variable for password
  end

  def authenticate password_entered
    self.password == password_entered
  end

  # INPUT= needs to be called on a password
  # Output = Will just add errors to the password
  def valid_new_password
    if @new_password.length <= 8  || @new_password == nil || validations_for_new_password
      self.errors.add(:password, "must be at least 8 characters long and contain a capital, a lowercase and a digit.")
    end
  end

  # this method actually returns false if all the validations are passed, as it is a helper method for valid_new_password
  def validations_for_new_password
    if @new_password.match(/[A-Z]/) && @new_password.match(/[a-z]/) && @new_password.match(/(\d|\p{S})/)
      return false
    end
    return true
  end

   #INPUT: Value is an integer representing upvote/downvote, votable is the OBJECT that the user is voting on. called as user.cast_vote
  # Output: true/false on whether or not vote was created. creates a vote object.
  def cast_vote (value, votable)
    unless votable.has_user_voted_on_this_before?(id)
      self.votes.create(value: value, votable_id: votable.id,votable_type: votable.class.to_s, user_id: self.id)
    else false
    end
  end

  #INPUT: called as user.reputation_from_posted_questions_and_answers
  #OUTPUT: total score as integer
  def reputation_from_posted_questions_and_answers
    answers.map{|answer| answer.votes.sum(:value)}.sum + questions.map{|question| question.votes.sum(:value)}.sum
  end

end
