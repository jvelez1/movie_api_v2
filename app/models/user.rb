class User < ApplicationRecord
  has_many :activity_logs
  has_many :purchases, -> { active.expiry_date }
end
