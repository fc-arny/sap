# == Schema Information
#
# Table name: sp_users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  login                  :string(255)      not null
#  email                  :string(255)
#  phone                  :string(255)      not null
#  role                   :string(255)
#  encrypted_password     :string(255)      not null
#  is_temporary           :boolean          default(FALSE)
#  authentication_token   :string(255)
#  remember_created_at    :datetime
#  reset_password_token   :string(255)
#  reset_password_code    :string(255)
#  reset_password_sent_at :datetime
#  reset_phone_new        :string(255)
#  reset_phone_code       :string(255)
#  reset_phone_sent_at    :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

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
  # ROLES = %w[admin salesman developer]

  # Relationships
  include Sap::Addressable


  # Validators
  validates :login, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }, unless: 'email.nil?'

  # Auth
  devise :database_authenticatable, :registerable, :rememberable, :recoverable

  before_save do
    login.downcase! if login
    email.downcase! if email
  end
end
