# frozen_string_literal: true

module ControllerHelpers
  def authenticated_header(user)
    Devise::JWT::TestHelpers.auth_headers(
      { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }, user
    )
  end

  def parsed_response
    @parsed_response ||= JSON.parse(response.body)
  end
end