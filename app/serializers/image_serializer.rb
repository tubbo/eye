class ImageSerializer < ActiveModel::Serializer
  attributes :id, :title, :file
  has_one :user
end
