class Answer < ApplicationRecord
  belongs_to :user, :userquestion
end
