# frozen_string_literal: true

require 'rails_helper'

describe ActivityLogMiddleware do
  subject { described_class.new(app) }
  
  let(:user) { create(:user) }
  let(:auth_headers) { authenticated_header(user) }
  let(:app) do
    lambda { |_env|
      [
        200,
        {
          'Content-Type' => 'application/json',
          'Authorization' => auth_headers['Authorization']
        },
        ['OK']
      ]
    }
  end

  let(:request) { Rack::MockRequest.new(subject) }
  let(:response) { request.get("/movies?user_id=#{user.id}") }

  it 'creates an ActivityLog' do
    expect { response }.to(
      change(ActivityLog, :count).by(1)
    )
  end
end
