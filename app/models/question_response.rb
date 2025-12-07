class QuestionResponse < ApplicationRecord
  belongs_to :workflow_run
  belongs_to :question
  belongs_to :answer_option
end
