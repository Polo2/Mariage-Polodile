class QuestionsController < ApplicationController

skip_before_action :authenticate_user!

  def create
    @question = Question.new question_params
    if @question.save
      redirect_to root_path, notice: "Merci pour votre message, bravo pour l'addition"
    else
      redirect_to root_path, alert: "Vous êtes certainement un robot... vous ne passerez pas"
    end
  end

  private

  def question_params
    params.require(:question).permit(
      :name,
      :email,
      :message,
      :number_1,
      :number_2,
      :security_answer
    )
  end

end
