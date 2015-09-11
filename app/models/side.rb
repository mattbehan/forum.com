class Side < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :sidings
  has_many :answers, through: :sidings
  has_many :edits, as: :editable
end
