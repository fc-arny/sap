# == Schema Information
#
# Table name: sap_users
#
#  id             :integer          not null, primary key
#  login          :string(255)      not null              # secret key = md5(md5(password) + salt)
#  password       :string(255)      not null
#  salt           :string(255)      not null
#  is_temporary   :boolean          default(FALSE)
#  token          :string(255)
#  valid_token_to :datetime
#  role_id        :integer
#  role_type      :string(255)
#  created_at     :datetime
#  updated_at     :datetime
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

  # Relationships
  ROLES = %w[admin customer]

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
