class PurchaseCreator
  DAYS = 2.days

  attr_reader :response

  def initialize(user:, params:)
    @params = params
    @user = user
  end

  def call
    purchase = find_or_initialize_purchase

    if purchase.expiry_date && purchase.expiry_date >= DateTime.current
      assign_error({ base: 'You already have this content available' })
      return
    end

    purchase.expiry_date = DateTime.current + DAYS

    if purchase.valid? && purchase.save!
      successful(purchase)
    else
      assign_error(purchase.errors)
    end
  end


  private 

  attr_reader :params, :user

  def find_or_initialize_purchase
    purchases = user.purchases
    purchase = purchases.find_by(video_footage_id: params[:video_footage_id].to_i)
    if purchase
      purchase.assign_attributes(params)
      return purchase
    end

    purchases.new(params)
  end

  def assign_error(errors)
    @response = OpenStruct.new(valid?: false, errors: errors)
  end

  def successful(purchase)
    @response = OpenStruct.new(valid?: true, object: purchase)
  end
end