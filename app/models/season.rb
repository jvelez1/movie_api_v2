class Season < VideoFootage
  has_many :episodes, -> { ordered_by_episodes } 

  validates :season_number, presence: true

  accepts_nested_attributes_for :episodes
end
