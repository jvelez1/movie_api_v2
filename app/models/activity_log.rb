class ActivityLog < ApplicationRecord
  belongs_to :user

  validates :path, uniqueness: true
  validates_presence_of :path
end
