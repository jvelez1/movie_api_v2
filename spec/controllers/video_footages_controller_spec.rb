require 'rails_helper'

RSpec.describe VideoFootagesController, type: :controller do
  let!(:user) { create(:user) }
  let!(:movie_1) { create(:movie) }
  let!(:season) { create(:season, name: 'GOT') }

  it 'returns all movies ordered' do
    get :index, params: { user_id: user.id }
    expect(parsed_response.count).to be(2)
    expect(parsed_response.pluck('id')).to match_array(
      [
        movie_1.id,
        season.id
      ]
    )
    expect(response).to have_http_status(:success)
  end
end
