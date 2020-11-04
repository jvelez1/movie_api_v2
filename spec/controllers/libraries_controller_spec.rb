require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do
  let!(:movie) { create(:movie) }
  let!(:season) { create(:season, name: 'GOT') }

  let!(:user) { create(:user) }
  
  let!(:purchase_1) do
    create(
      :purchase,
      user_id: user.id,
      expiry_date: DateTime.current + 1.day,
      video_footage: movie
    )
  end

  let!(:purchase_2) do
    create(
      :purchase,
      user_id: user.id,
      expiry_date: DateTime.current - 1.day,
      video_footage: season
    )
  end

  it 'returns all movies ordered' do
    get :index, params: { user_id: user.id }
    expect(parsed_response.count).to eq(1)
    expect(parsed_response.pluck('id')).to match_array(
      [
        purchase_1.id
      ]
    )
    expect(response).to have_http_status(:success)
  end
end
