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

require 'rails_helper'

RSpec.describe QuestionOption, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
