class PurchasesCoupon < ApplicationRecord
  belongs_to :purchase
  belongs_to :coupon
end