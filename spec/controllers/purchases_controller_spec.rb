require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let!(:movie) { create(:movie) }
  let!(:user) { create(:user) }

  it 'returns a new purchase' do
    post :create, params: { user_id: user.id, video_footage_id: movie.id, price: 100, video_quality: 'HD' }
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
      post :create, params: { user_id: user.id, video_footage_id: movie.id, price: 100, video_quality: 'HD' }
      expect(parsed_response).to include(
        "base" => 'You already have this content available'
      )
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
