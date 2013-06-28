# == Schema Information
#
# Table name: sap.users
#
#  id             :integer          not null, primary key
#  login          :string(255)      not null
#  password       :string(255)      not null
#  salt           :string(255)      not null
#  token          :string(255)
#  valid_token_to :datetime
#  role_id        :integer
#  role_type      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  is_temporary   :boolean          default(FALSE)
#

# -------------------------------------------------------------
# Base model for users
# -------------------------------------------------------------
# ==Fields:
# login           - login string (email or phone for customer)
# password        - secret key = md5(md5(password) + salt)
# salt            - increase secure for password
# role_id         - role type: Admin, Manager and Customer
# token           - hash for restore token
# valid_token_to  - expire token
# -------------------------------------------------------------
class Sap::User < SapModel

  include Perms::Model
  include ApplicationHelper

  # Fields
  attr_accessible :id, :login, :password, :salt, :token, :valid_token_to, :name, :is_temporary

  # Relationships
  belongs_to :role, :polymorphic => true

  # Restrict
  restrict do |user, record|
    scope :fetch, -> { where('id IN (30,31)') }
    scope :delete, -> { where('id IN (30,31)') }
    can [:view, :create, :update]
  end



  # -------------------------------------------------------------
  # Auth user by password
  # -------------------------------------------------------------
  def auth_by_password(password)
    hash = hash_password(password, self.salt)
    result = ( hash == self.password )
  end



  class << self

    # -------------------------------------------------------------
    # Generate token
    # -------------------------------------------------------------
    def generate_token(user)
      Digest::SHA1.hexdigest( user.name + user.salt + user.password )
    end

    # -------------------------------------------------------------
    # Find user by valid token
    # -------------------------------------------------------------
    def get_user_by_valid_token(token)
      self.where('token = ? AND (valid_token_to < ? OR valid_token_to IS NULL)', token).first
    end
  end
end
