# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  description     :string
#  additional_info :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Question < ApplicationRecord
  has_many :user_questions
  has_many :users, through: :user_questions
  has_many :question_options


  def self.get_random_question(user_id: user_id)
    user_questions = Question.left_outer_joins(:user_questions).where(user_questions: {user_id: user_id}).distinct

    Question.all.reject {|question| user_questions.find{|user_question| user_question.id == question.id}}.sample
  end

  def self.get_package_question(user_id)
    questions = (0..4).reduce([]) do |accu, index|
      get_question = false

      while get_question == false do
        new_question = get_random_question(user_id)

        get_question = question_in_the_package?(accu, new_question)
      end
      accu << get_random_question
      accu
    end

    questions
  end

  def self.question_in_the_package?(accu, new_question)
    found = acuu.find {|package_question| package_question.id == new_question.id }

    found.nil?
  end
end
