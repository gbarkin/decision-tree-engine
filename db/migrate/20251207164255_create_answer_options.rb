class CreateAnswerOptions < ActiveRecord::Migration[7.1]
  def change
    create_table :answer_options do |t|
      t.references :question, null: false, foreign_key: true
      t.string :label, null: false
      t.string :value
      t.integer :next_question_id
      t.string :outcome_key
      t.integer :position, null: false, default: 0

      t.timestamps
    end

    add_foreign_key :answer_options, :questions, column: :next_question_id
  end
end
