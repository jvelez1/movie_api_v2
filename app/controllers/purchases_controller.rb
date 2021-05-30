class PurchasesController < ApplicationController
  def create
    response = PurchaseCreator.new(
      user: current_user,
      params: purchase_params.to_h.deep_symbolize_keys
    ).call

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
