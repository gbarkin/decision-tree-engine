class Question < ApplicationRecord
  belongs_to :workflow
  has_many :answer_options, -> { order(:position) }, dependent: :destroy

  validates :text, presence: true
end
