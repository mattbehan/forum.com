class CreateVotes < ActiveRecord::Migration
  def change
    create table :votes do |t|
      t.integer :value, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false
      t.timestamps null: false
    end
    add_index :votes, :votable_id, :user_id



  end
end
