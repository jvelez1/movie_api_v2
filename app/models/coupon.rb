class Coupon < ApplicationRecord
  has_one :purchase_coupon

  validates :code, uniqueness: true
  validates_presence_of :code
end