class CreateAnswerOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :answer_options do |t|
      t.references :question, null: false, foreign_key: true
      t.string :label
      t.string :value
      t.integer :next_question_id
      t.string :outcome_key
      t.integer :position

      t.timestamps
    end
  end
end
