# frozen_string_literal: true

require 'rails_helper'

describe ActivityLogMiddleware do
  subject { described_class.new(app) }

  let(:app) do
    lambda { |_env|
      [
        200,
        {
          'Content-Type' => 'application/json'
        },
        ['OK']
      ]
    }
  end
  let(:user) { create(:user) }
  let(:request) { Rack::MockRequest.new(subject) }
  let(:response) { request.get("/movies?user_id=#{user.id}") }

  it 'creates an ActivityLog' do
    expect { response }.to(
      change(ActivityLog, :count).by(1)
    )
  end
end
