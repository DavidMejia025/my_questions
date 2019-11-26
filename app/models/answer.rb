# == Schema Information
#
# Table name: answers
#
#  id               :bigint           not null, primary key
#  user_id          :integer
#  solution         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_question_id :integer
#

class Answer < ApplicationRecord
  after_create :update_user_question_status

  belongs_to :user
  belongs_to :user_question

  def update_user_question_status
    user_question = self.user_question
    attempts      = user_question.attempts

    user_question.update(attempts: attempts + 1)
  end

  def evaluate
    user_question  = self.user_question
    user_solution  = self.solution

    question       = Question.find(user_question.question_id)
    correct_answer = question.question_options.where(correct_answer: true).first.identifier

    return false unless user_solution == correct_answer

    user_question.update(solved: true)
  end
end
