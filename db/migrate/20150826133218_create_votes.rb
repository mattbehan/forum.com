class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.belongs_to :user, index: true
      t.timestamps
    end
    # add_index :votes, :votable_id, :user_id

  end
end
