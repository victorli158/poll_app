class Question < ApplicationRecord
  validates :poll_id, :text, presence: true

  belongs_to :poll

  has_many :answer_choices

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    # answer_choices = self.answer_choices.includes(:responses)
    #
    # result = {}
    #
    # answer_choices.each do |choice|
    #   result[choice.text] = choice.responses.length
    # end
    #
    # result

    result = Question.find_by_sql(<<-SQL)
      SELECT
        ac.*, COUNT(rs.user_id) AS vote
      FROM
        answer_choices ac
      LEFT JOIN
        responses rs ON ac.id = rs.answer_choice_id
      WHERE
        ac.question_id = #{self.id}
      GROUP BY
        ac.id
    SQL

    result.map { |ac| [ac.text, ac.vote] }.to_h
  end
end
