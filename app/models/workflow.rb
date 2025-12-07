class Workflow < ApplicationRecord
  has_many :questions, -> { order(:position) }, dependent: :destroy
  has_many :workflow_runs, dependent: :destroy

  belongs_to :start_question, class_name: "Question", optional: true

  validates :name, presence: true
end
