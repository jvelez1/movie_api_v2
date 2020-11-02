require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'associations' do
    it { should belong_to(:season) }
  end
end
