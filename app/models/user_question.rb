# == Schema Information
#
# Table name: user_questions
#
#  id          :bigint           not null, primary key
#  user_id     :integer
#  question_id :integer
#  attempts    :integer          default(0)
#  solved      :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserQuestion < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many   :answers
end
