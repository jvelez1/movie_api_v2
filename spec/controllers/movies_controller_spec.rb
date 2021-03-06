require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie_1) { create(:movie) }
  let!(:movie_2) { create(:movie, :star_wars) }
  let!(:user) { create(:user) }

  let(:auth_headers) { authenticated_header(user) }
  before  { request.headers.merge(auth_headers) }

  it 'returns all movies ordered' do
    get :index

    expect(parsed_response.pluck('id')).to match_array(
      [
        movie_1.id,
        movie_2.id
      ]
    )
    expect(response).to have_http_status(:success)
  end
end
