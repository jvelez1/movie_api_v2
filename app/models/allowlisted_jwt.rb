# frozen_string_literal: true

class AllowlistedJwt < ApplicationRecord
  validates :jti, presence: true
  validates :exp, presence: true

  def self.first_by_token(token)
    find_by(jti: decode_token(token)['jti'])
  end

  def self.decode_token(token)
    token_with_out_prefix = token.delete_prefix('Bearer ')
    Warden::JWTAuth::TokenDecoder.new.call(token_with_out_prefix)
  end
end
