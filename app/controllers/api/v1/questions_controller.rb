class Api::V1::QuestionsController < ApplicationController
  before_action :admin_only, only: %i[index bulk_create destroy]

  def index
  end

  def question
    question      = Question.get_random_question(user_id: params[:user_id])

    user_question = UserQuestion.create!(user_id: params[:user_id], question_id: question.id)

    single_question_response(user_question)
  end

  def question_package
  end

  def bull_create
  end

  def destroy
  end
end
