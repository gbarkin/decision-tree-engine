class AnswerOption < ApplicationRecord
  belongs_to :question
  belongs_to :next_question, class_name: "Question", optional: true

  validates :label, presence: true

  def terminal?
    next_question.nil?
  end
end
