require 'rails_helper'

RSpec.describe PurchasesCoupon, type: :model do
  describe '#associations' do
    it { should belong_to(:coupon) }
    it { should belong_to(:purchase) }
  end
end

