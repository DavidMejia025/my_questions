# == Schema Information
#
# Table name: question_options
#
#  id             :bigint           not null, primary key
#  question_id    :integer
#  description    :string
#  identifier     :integer
#  correct_answer :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class QuestionOption < ApplicationRecord
  belongs_to :question

  enum identifier: %i[a b c d e]
end
