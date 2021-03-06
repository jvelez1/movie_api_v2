require 'rails_helper'

RSpec.describe Season do
  describe 'associations' do
    it { should have_many(:episodes) }
  end

  it { should accept_nested_attributes_for(:episodes) }
end
