class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  validate :not_author_response

  belongs_to :user

  belongs_to :answer_choice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

  private
  def not_duplicate_response
    if respondent_already_answered?
      errors[:base] << "You already answered!"
    end
  end

  def not_author_response
    if respondent_is_author?
      errors[:base] << "You can't respond to your own poll"
    end
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def respondent_is_author?
    answer_choice.question.poll.author_id == user_id
  end
end
