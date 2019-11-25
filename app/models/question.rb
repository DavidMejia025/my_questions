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
end
