class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  # validate :not_duplicate_response

  belongs_to :user

  belongs_to :answer_choice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  private
  # def not_duplicate_response
  #   if self.exists?(user_id: @user_id, answer_choice_id: @answer_choice_id)
  #     errors[:base] << "Invalid response!"
  #   end
  # end
end
