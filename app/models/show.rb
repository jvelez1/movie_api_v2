class Show < ApplicationRecord
  has_many :seasons
  has_many :episodes, through: :seasons
  accepts_nested_attributes_for :seasons
end
