class Purchase < ApplicationRecord
  enum video_quality:  { SD: 'SD', HD: 'HD' }

  scope :active, -> { where('expiry_date >= ?', DateTime.current) }
  scope :expiry_date, -> { order(expiry_date: :desc) }

  belongs_to :user
  belongs_to :video_footage

  has_many :purchases_coupons

  validates :expiry_date, presence: true
  validates_with PurchaseCustomValidator
end
