class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.timestamps null: false
    end
    add_index :answers, :user_id
  end
end
