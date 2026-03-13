class User < ApplicationRecord
  has_secure_password
  belongs_to :tenant
  enum :role, { recruiter: 0, manager: 1, staff: 3, admin: 4 }
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, :first_name, :last_name, presence: true
  before_save { email&.downcase! }
end
