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

require 'rails_helper'

RSpec.describe Question, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
