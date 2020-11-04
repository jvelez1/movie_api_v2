class VideoFootage < ApplicationRecord
  scope :ordered, -> { order(created_at: :asc) }

  validates :name, :plot, presence: true
end
