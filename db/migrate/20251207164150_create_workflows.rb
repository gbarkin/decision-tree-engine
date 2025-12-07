class CreateWorkflows < ActiveRecord::Migration[7.1]
  def change
    create_table :workflows do |t|
      t.string :name, null: false
      t.text :description
      t.integer :start_question_id

      t.timestamps
    end

    # 🔴 Remove or comment this out for now:
    # add_foreign_key :workflows, :questions, column: :start_question_id
  end
end
