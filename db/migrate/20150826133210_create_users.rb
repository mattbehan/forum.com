class CreateUsers < ActiveRecord::Migration
  def change
    create table :users do |t|
      t.string :display_name, null:false
      t.string :email, null:false
      t.string :password_hash, null: false
      t.string :location null: false
      t.timestamps null: false
    end
    add_index :users, :unique => true, :email, :unique => true
  end
end
