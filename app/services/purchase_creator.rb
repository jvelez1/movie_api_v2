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
        build_response(purchase)
      end
    end
  rescue ActiveRecord::RecordInvalid
    build_response(purchase.errors, true)
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
    @coupon ||= begin
      coupon_code = params[:code]
      return Coupon.find_by(code: coupon_code) if coupon_code.present?
    end
  end

  def build_response(object, error = false)
    @response = if error
                  OpenStruct.new(valid?: false, errors: object)
                else
                  OpenStruct.new(valid?: true, object: object)
                end
  end
end

