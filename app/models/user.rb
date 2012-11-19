class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include ActiveModel::ForbiddenAttributesProtection
  has_secure_password

  field :email, type: String
  field :password_digest, type: String

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
end
