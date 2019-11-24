class User < ApplicationRecord
  after_initialize :set_default_role, :if => :new_record?
  has_secure_password

  validates_presence_of :username, :password_digest
  #validates :name, :email, uniqueness: true

  enum role: %i[student admin]

  def set_default_role
    self.role ||= :student
  end
end
