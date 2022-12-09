class CreateChoices < ActiveRecord::Migration[6.1]
  def change
    create_table :choices do |t|
      t.belongs_to :question
      t.string :choice
      t.integer :votes

      t.timestamps
    end
  end
end
