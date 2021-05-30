class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :activity_logs
  has_many :purchases, -> { active.expiry_date }

  def self.find_by_token(token)
    find(AllowlistedJwt.first_by_token(token).user_id) if token
  end
end
