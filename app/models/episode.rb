class Episode < ApplicationRecord
  belongs_to :season
  scope :ordered_by_episodes, -> { order(episode_number: :asc) }
end
