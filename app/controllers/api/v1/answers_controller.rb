class Api::V1::AnswersController < ApplicationController
  def create
    user_id = params[:user_id]

    answer  = User.find(user_id).create_answer(answer_params)
    result  = answer.evaluate

    json_response({correct: result}.to_json)
  end

  def destroy
  end

  private

  def answer_params
    params.permit(:answer, :question_id)
  end
end
