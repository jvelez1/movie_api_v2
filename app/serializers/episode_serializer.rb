class EpisodeSerializer < ActiveModel::Serializer
  cache

  attributes :id, :title, :episode_number
end
