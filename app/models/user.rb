class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  has_many :votes, :as => :votable

  has_many :questions
  has_many :answers


  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate password_entered
    self.password == password_entered
  end

  # INPUT= needs to be called on a password
  # Output = Will just add errors to the password
  def valid_new_password
    if self.length <= 8  || self == nil || !self.validations_for_new_password
      self.errors.add("Please enter a valid password")
    end
  end

  # this method actually returns false if all the validations are passed, as it is a helper method for valid_new_password
  def validations_for_new_password
    if self.match(/[A-Z]/) && self.match(/[a-z]/) && self.match && self.match(/(\d)|(\p{S})/)
      return false
    end
    return true
  end

end
