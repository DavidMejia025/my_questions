# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  role            :integer
#

class User < ApplicationRecord
  after_initialize :set_default_role, :if => :new_record?

  has_many :user_questions
  has_many :questions, through: :user_questions
  has_many :answers

  has_secure_password

  validates_presence_of :username, :password_digest
  #validates :name, :email, uniqueness: true

  enum role: %i[student admin]

  def set_default_role
    self.role ||= :student
  end

  def create_answer(params)
puts "errererrrrrrrrrrr"
    puts params
    self.answers.create!(solution: params[:answer], user_question_id: params[:question_id])
  end
end
