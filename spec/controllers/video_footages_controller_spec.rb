require 'rails_helper'

RSpec.describe VideoFootagesController, type: :controller do
  let!(:movie_1) { create(:movie) }
  let!(:season) { create(:season, name: 'GOT') }

  it 'returns all movies ordered' do
    get :index
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
