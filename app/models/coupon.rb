class Coupon < ApplicationRecord
  validates :code, uniqueness: true
  validates_presence_of :code
end