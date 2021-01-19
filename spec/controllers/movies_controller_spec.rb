require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie_1) { create(:movie) }
  let!(:movie_2) { create(:movie, :star_wars) }
  let!(:user) { create(:user) }

  it 'returns all movies ordered' do
    get :index, params: { user_id: user.id }

    expect(parsed_response.pluck('id')).to match_array(
      [
        movie_1.id,
        movie_2.id
      ]
    )
    expect(response).to have_http_status(:success)
  end


  context 'When tracking activity logs' do
    let!(:activity_log) { create(:activity_log, counter: 1, user_id: user.id) }

    it 'should increases activity log in path /movies' do
      get :index, params: { user_id: user.id }

      expect(response).to have_http_status(:success)
      expect(activity_log.reload.counter).to eq(2)
      expect(activity_log.user_id).to eq(user.id)
    end
  end

end
