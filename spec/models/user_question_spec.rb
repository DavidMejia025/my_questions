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

require 'rails_helper'

RSpec.describe UserQuestion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
