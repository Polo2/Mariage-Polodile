class QuestionMailer < ApplicationMailer
  def new_question(question)
    @question = question
    mail(from: "paul@mariage-participatif.fr", to: "polo2bodi@gmail.com",  subject: "mariage-participatif.fr : Nouveau message de #{@question.name}")
  end
end

