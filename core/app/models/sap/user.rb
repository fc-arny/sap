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
# -------------------------------------------------------------
class Sap::User < ActiveRecord::Base

  # Fields
  attr_accessible :id, :login, :encrypted_password, :name, :is_temporary, :authentication_token

  # Relationships
  belongs_to :role, :polymorphic => true

  # Auth
  devise :database_authenticatable, :registerable, :token_authenticatable
end
