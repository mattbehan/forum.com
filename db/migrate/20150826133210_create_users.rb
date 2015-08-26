class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :display_name, null:false
      t.string :email, null:false
      t.string :password_hash, null: false
      t.string :location, null: false
      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
