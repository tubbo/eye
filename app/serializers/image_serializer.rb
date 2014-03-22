class ImageSerializer < ActiveModel::Serializer
  attributes :id, :title, :original, :thumbnail, :source
  has_one :user

  def original
    object.file.url
  end

  def thumbnail
    object.file.url :thumb
  end
end
