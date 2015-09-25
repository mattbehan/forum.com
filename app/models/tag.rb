class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tags
  has_many :questions, through: :tags
end
