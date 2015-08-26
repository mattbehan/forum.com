class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes, :as => :votable

  has_many :questions
  has_many :answers


  validates :display_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

end
