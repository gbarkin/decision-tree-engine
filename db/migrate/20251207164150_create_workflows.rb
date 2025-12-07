class CreateWorkflows < ActiveRecord::Migration[8.1]
  def change
    create_table :workflows do |t|
      t.string :name
      t.text :description
      t.integer :start_question_id

      t.timestamps
    end
  end
end
