class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.belongs_to :user, index: true
      t.belongs_to :question, index: true
      t.timestamps null: false
    end
  end
end
