class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :expiry_date, :video_quality, :price
  belongs_to :video_footage, serializer: VideoFootageSerializer
end
