class CreateSidedUsers < ActiveRecord::Migration
  def change
    create_table :sided_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :side, index: true
    end
  end
end
