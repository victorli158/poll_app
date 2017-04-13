class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true

  belongs_to :user

  belongs_to :answer_choice
end
