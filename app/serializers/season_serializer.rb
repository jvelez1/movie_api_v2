class SeasonSerializer < ActiveModel::Serializer
  cache

  attributes :id, :name, :plot, :season_number, :episodes


  def episodes
    # insted of has_many: :episodes To avoid read nested caches
    object.episodes
  end
end
