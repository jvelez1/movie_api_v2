class PurchaseCustomValidator < ActiveModel::Validator
  def validate(record)
    validate_expire_date(record) &&
      validate_coupon_code(record)
  end

  private

  attr_reader :purchase, :coupon

  def validate_expire_date(record)
    if record.expiry_date_changed?
      previous_expiry_date = record.expiry_date_was
    end

    if previous_expiry_date && previous_expiry_date >= DateTime.current
      record.errors.add(:expiry_date, 'You already have this content available')
    end
    record.errors.blank?
  end

  def validate_coupon_code(record)
    coupon = record.purchases_coupons.last&.coupon
    if coupon&.persisted? && coupon&.taken?
      record.errors.add(:coupon, 'Ups! Invalid Coupon')
    end
  end
end