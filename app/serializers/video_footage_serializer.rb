class VideoFootageSerializer < ActiveModel::Serializer
  cache

  attributes :id, :name, :plot, :type
  attribute :season_number, if: :season?

  def season?
    object.type == 'Season'
  end
end
