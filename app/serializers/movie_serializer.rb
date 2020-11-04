class MovieSerializer < ActiveModel::Serializer
  cache

  attributes :id, :name, :plot
end
