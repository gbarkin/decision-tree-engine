class CreateWorkflowRuns < ActiveRecord::Migration[7.1]
  def change
    create_table :workflow_runs do |t|
      t.references :workflow, null: false, foreign_key: true
      t.integer :respondent_id
      t.datetime :started_at, null: false
      t.datetime :finished_at
      t.string :outcome_key

      t.timestamps
    end
  end
end
