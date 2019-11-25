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
  belongs_to :user
  belongs_to :user_question
end
