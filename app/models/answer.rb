class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :user_question
end
