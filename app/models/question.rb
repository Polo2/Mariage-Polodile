class Question < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "un vrai mail pour une vraie réponse, svp" }
  validates :message, presence: true, length: { minimum: 33, too_short: "33 charactères minimum" }
  validate :sum_is_correct
  after_create :send_question

  def text_number_1
    number_as_text(number_1)
  end

  def text_number_2
    number_as_text(number_2)
  end

  private

  def number_as_text(number)
    case number
    when 0
      "zero"
    when 1
      "un"
    when 2
      "deux"
    when 3
      "trois"
    when 4
      "quatre"
    when 5
      "cinq"
    when 6
      "six"
    when 7
      "sept"
    when 8
      "huit"
    when 9
      "neuf"
    when 10
      "dix"
    end
  end

  def sum_is_correct
    return unless number_1 && number_2
    unless number_1 + number_2 == security_answer
      errors[:base] << "Alert SPAM"
    end
  end

  def send_question
    QuestionMailer.new_question(self).deliver_now
  end
end
