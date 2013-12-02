# -------------------------------------------------------------
# Base model for users
# Auth by login.
# If login has only digits
#   login -> phone
# elsif login has '@'
#   login -> email
# else
#   login -> just string
# end
# -------------------------------------------------------------
class Sap::User < ActiveRecord::Base
  ROLES = %w[admin customer]

  # Relationships
  include Sap::Addressable


  # Validators
  validates :login, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }, unless: "email.nil?"

  # Auth
  devise :database_authenticatable, :registerable, :rememberable, :recoverable

  before_save do
    self.login.downcase! if self.login
    self.email.downcase! if self.email
  end
end
