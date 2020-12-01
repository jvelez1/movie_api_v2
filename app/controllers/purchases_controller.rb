class PurchasesController < ApplicationController
  def create
    service = PurchaseCreator.new(user: user, params: purchase_params.to_h)
    service.call
    response = service.response

    if response.valid?
      render json: response.object
    else
      render json: response.errors, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.permit(
      :video_footage_id,
      :price,
      :video_quality,
      :code # coupon code
    )
  end
end
