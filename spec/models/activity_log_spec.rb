require 'rails_helper'

RSpec.describe ActivityLog, type: :model do
  describe '#validations' do
    subject { build(:activity_log) }
    let!(:user) { create(:user) }
    it { should validate_presence_of(:path) }
    it do
      create(:activity_log, user_id: user.id)
      should validate_uniqueness_of(:path)
    end
  end

  describe '#associations' do
    it { should belong_to(:user) }
  end
end