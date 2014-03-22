class Image < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :source, presence: true
  validates :url, :presence => true, :if => :mirror?
  validates :file, :presence => true, :unless => :mirror?

  mount_uploader :file, ImageUploader

  def mirror?
    source == 'url'
  end
end
