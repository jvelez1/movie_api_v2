require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe 'validations' do
    subject { build(:coupon) }
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code) }
  end
end

