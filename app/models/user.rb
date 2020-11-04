class User < ApplicationRecord
  has_many :purchases, -> { active.expiry_date }
end
