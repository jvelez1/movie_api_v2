require 'rails_helper'

RSpec.describe SeasonsController, type: :controller do
  let!(:season_1) do
    create(:season) do |season|
      create_list(:episode, 5, season: season)
    end
  end

  let!(:season_2) do
    create(:season, name: 'GOT') do |season|
      create_list(:episode, 3, season: season)
    end
  end

  it 'returns all seasons ordered including episodes' do
    get :index
    expect(parsed_response[0]['episodes'].count).to eq(5)
    expect(parsed_response.pluck('id')).to match_array(
      [
        season_1.id,
        season_2.id
      ]
    )
    expect(response).to have_http_status(:success)
  end
end
