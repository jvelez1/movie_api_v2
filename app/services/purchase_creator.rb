class PurchaseCreator
  DAYS = 2.days

  attr_reader :response

  def initialize(user:, params:)
    @params = params
    @purchase_params = params.reject { |key, value| key == 'code' }
    @user = user
  end

  def call
    purchase = find_or_initialize_purchase

    return unless validate(purchase)
    purchase.expiry_date = DateTime.current + DAYS
    assign_coupon(purchase) if coupon

    if purchase.valid? && purchase.save!
      coupon.update(taken: true) if coupon # To implement
      successful(purchase)
    else
      assign_error(purchase.errors)
    end
  end


  private 

  attr_reader :params, :user, :purchase_params

  def find_or_initialize_purchase
    purchases = user.purchases

    purchase = purchases.find_by(video_footage_id: purchase_params[:video_footage_id].to_i)
    if purchase
      purchase.assign_attributes(purchase_params)
      return purchase
    end

    purchases.new(purchase_params)
  end

  def assign_error(errors)
    @response = OpenStruct.new(valid?: false, errors: errors)
  end

  def successful(purchase)
    @response = OpenStruct.new(valid?: true, object: purchase)
  end

  def validate(purchase)
    validate_expire_date(purchase) &&
      validate_coupon_code
  end

  def validate_expire_date(purchase)
    if purchase.expiry_date && purchase.expiry_date >= DateTime.current
      assign_error({ base: 'You already have this content available' })
      return false
    end

    true
  end

  def validate_coupon_code
    if coupon&.taken?
      assign_error({ base: 'Ups! Invalid Coupon' })
      return false
    end

    true
  end

  def coupon
    return @coupon if defined? @coupon
    return unless coupon_code

    @coupon = Coupon.find_by(code: coupon_code)
  end

  def coupon_code
    params['code']
  end

  def assign_coupon(purchase)
    purchase.purchases_coupons.build(
      coupon_id: coupon.id
    )

    purchase.assign_attributes(price: 0)
  end
end

