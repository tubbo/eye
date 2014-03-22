class Image < ActiveRecord::Base
  belongs_to :user

  SOURCE_TYPES = %w(url file)

  before_validation :download_image, \
    :if => :mirror?, :on => :create

  validates :title, presence: true
  validates :source, presence: true
  validates :source_type, inclusion: { in: SOURCE_TYPES }

  mount_uploader :file, ImageUploader

  # Test if we are mirroring an image.
  def mirror?
    source_type == 'url'
  end

  def uri
    @uri ||= URI.parse source['url']
  end

  # Read the first attribute of the source hash, which tells us our
  # type.
  def source_type
    @source_type ||= source.keys.first
  end

  private
  def download_image
    DownloadImageWorker.perform_async self
  end
end
