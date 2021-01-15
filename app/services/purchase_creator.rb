class PurchaseCreator
  DAYS = 2.days

  attr_reader :response

  def initialize(user:, params:)
    @params = params
    @user = user
  end

  def call
    purchase = find_or_initialize_purchase
    assign_coupon(purchase) if coupon
    save_purchase(purchase)
  end

  private 

  attr_reader :params, :user

  def save_purchase(purchase)
    ActiveRecord::Base.transaction do
      if purchase.save!
        coupon.update!(taken: true) if coupon
        successful(purchase)
      end
    end
  rescue ActiveRecord::RecordInvalid
    assign_error(purchase.errors)
  end

  def find_or_initialize_purchase
    purchases = user.purchases
    purchase = purchases.find_by(video_footage_id: purchase_params[:video_footage_id].to_i)

    if purchase
      purchase.assign_attributes(purchase_params)
      return purchase
    end

    purchases.new(purchase_params)
  end

  def purchase_params
    @purchase_params ||= params.reject { |key, value| key == :code }
                               .merge(expiry_date: DateTime.current + DAYS)
  end

  def assign_coupon(purchase)
    purchase.purchases_coupons.build(
      coupon_id: coupon.id
    )
    purchase.assign_attributes(price: 0)
  end

  def coupon
    return @coupon if defined? @coupon

    coupon_code = params[:code]
    return unless coupon_code

    @coupon = Coupon.find_by(code: coupon_code)
  end

  def assign_error(errors)
    @response = OpenStruct.new(valid?: false, errors: errors)
  end

  def successful(purchase)
    @response = OpenStruct.new(valid?: true, object: purchase)
  end
end

