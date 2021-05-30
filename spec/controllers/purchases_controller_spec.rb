require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let!(:movie) { create(:movie) }
  let!(:user) { create(:user) }
  let(:auth_headers) { authenticated_header(user) }

  before  { request.headers.merge(auth_headers) }

  it 'returns a new purchase' do
    post :create, params: { video_footage_id: movie.id, price: 100, video_quality: 'HD' }
    expect(response).to have_http_status(:success)
  end

  context 'When there is an valid media' do
    let!(:purchase_1) do
      create(
        :purchase,
        user_id: user.id,
        expiry_date: DateTime.current + 1.day,
        video_footage: movie
      )
    end

    it 'returns and error when there is a purchase' do
      post :create, params: { video_footage_id: movie.id, price: 100, video_quality: 'HD' }
      expect(parsed_response).to include(
        "expiry_date" => ['You already have this content available']
      )
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context 'when valid coupon' do
    let!(:coupon) { create(:coupon, code: 'COUPON2020', taken: false) }

    it 'should be successful' do
      post :create, params: { video_footage_id: movie.id, price: 100, video_quality: 'HD', code: 'COUPON2020' }
      expect(response).to have_http_status(:success)
    end
  end

  context 'When invalid coupon' do
    let!(:coupon) { create(:coupon, code: 'COUPON2020', taken: true) }

    it 'returns an error' do
      post :create, params: { video_footage_id: movie.id, price: 100, video_quality: 'HD', code: coupon.code }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_response).to include(
        "coupon" => ['Ups! Invalid Coupon']
      )
    end
  end
end
