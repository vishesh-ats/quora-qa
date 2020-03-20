class HomeController < ApplicationController
  
  def questions
    @questions = Question.all.order(created_at: :desc)
  end

  def question
    @question = Question.where(id: params[:question_id]).first
  end
end
