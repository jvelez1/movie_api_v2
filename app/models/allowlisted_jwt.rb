# frozen_string_literal: true

class AllowlistedJwt < ApplicationRecord
  validates :jti, presence: true
  validates :exp, presence: true
end
