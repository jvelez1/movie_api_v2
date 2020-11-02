class Season < VideoFootage
  has_many :episodes
  accepts_nested_attributes_for :episodes

  validates :season_number, presence: true
end
