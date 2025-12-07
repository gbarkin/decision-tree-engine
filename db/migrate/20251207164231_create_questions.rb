class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.references :workflow, null: false, foreign_key: true
      t.string :text, null: false
      t.string :kind, null: false, default: "multiple_choice"
      t.integer :position, null: false, default: 0

      t.timestamps
    end
  end
end
