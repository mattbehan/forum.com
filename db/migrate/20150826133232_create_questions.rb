class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
