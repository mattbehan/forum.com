class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
  # add_index :questions, :user_id
end
