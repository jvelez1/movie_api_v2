class Movie < VideoFootage
  scope :ordered, -> { order(created_at: :asc) }
end
