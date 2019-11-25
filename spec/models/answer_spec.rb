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

require 'rails_helper'

RSpec.describe Answer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
