class Edit < ActiveRecord::Base
  belongs_to :editable, polymorphic: true

end
