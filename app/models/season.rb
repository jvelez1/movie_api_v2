class Season < VideoFootage
  scope :ordered, -> { order(created_at: :asc) }

  has_many :episodes, -> { ordered_by_episodes } 
  validates :season_number, presence: true
  accepts_nested_attributes_for :episodes
end
