require 'rails_helper'

RSpec.describe Show, type: :model do
  describe 'associations' do
    it { should have_many(:episodes).through(:seasons) }
    it { should have_many(:seasons) }
  end

  it { should accept_nested_attributes_for(:seasons) }
end
