class CreateQuestionResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :question_responses do |t|
      t.references :workflow_run, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer_option, null: false, foreign_key: true
      t.text :free_text_answer
      t.datetime :answered_at, null: false

      t.timestamps
    end
  end
end
