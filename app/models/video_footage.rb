class VideoFootage < ApplicationRecord
  validates :name, :plot, presence: true
end
