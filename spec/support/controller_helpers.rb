# frozen_string_literal: true

module ControllerHelpers
  def parsed_response
    @parsed_response ||= JSON.parse(response.body)
  end
end