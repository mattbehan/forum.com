class CreateUsers < ActiveRecord::Migration
  def change
    create table :users do |t|
      t.string :display_name, nil:false
      t.string :email, nil:false
      t.string :password_hash
      t.string :location

      t.timestamps
    end
    add_index :users, :email, :unique => true
  end
end
