class Question < ApplicationRecord
  validates :poll_id, :text, presence: true

  belongs_to :poll

  has_many :answer_choices
end
