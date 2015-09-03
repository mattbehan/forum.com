class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name, null:false
      t.string :email, null:false
      t.string :password_hash, null: false
      t.string :location
      t.integer :tokens
      t.timestamps null: false
    end
    add_index :users, :email, :unique => true
  end
end
