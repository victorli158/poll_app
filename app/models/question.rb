class Question < ApplicationRecord
  validates :poll_id, :text, presence: true

  belongs_to :poll

  has_many :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    answer_choices = self.answer_choices.includes(:responses)

    result = {}

    answer_choices.each do |choice|
      result[choice.text] = choice.responses.length
    end

    result
  end
end
