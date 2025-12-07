class WorkflowRun < ApplicationRecord
  belongs_to :workflow
  has_many :question_responses, dependent: :destroy

  def current_question
    return nil if finished_at.present?

    if question_responses.empty?
      workflow.start_question
    else
      last_answer = question_responses.order(:answered_at).last.answer_option
      last_answer.next_question
    end
  end
end
