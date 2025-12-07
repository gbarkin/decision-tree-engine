class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :workflow, null: false, foreign_key: true
      t.string :text
      t.string :kind
      t.integer :position

      t.timestamps
    end
  end
end
