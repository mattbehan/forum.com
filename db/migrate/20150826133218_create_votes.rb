class CreateVotes < ActiveRecord::Migration
  def change
    create table :votes do |t|
      t.integer :value, null: false
      t.string :votable_type, null: false
      t.timestamps
    end


  end
end
