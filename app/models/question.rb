class Question < ApplicationRecord
  has_many :user_questions
  has_many :options
end
