class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :question

      t.timestamps
    end
  end
end
